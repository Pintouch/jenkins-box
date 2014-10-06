# Jenkins Box for Travis

[![Build Status][BS img]][Build Status]
[![Dependency Status][DS img]][Dependency Status]

## Description

Jenkins box ready for in-house TravisCI emulation.

Helps you build a local VM for ruby development by using [Vagrant][] + [Chef-Solo][]

## Features

- [Jenkins][] with port forwarding to port 8080
- Build [Ruby][] projects using [RVM][]

## Installation

Ensure you meet the [requirements](#requirements) then automatically verify and install by using the bootstrap script:

    ./bootstrap.sh

Or avoid the bootstrap.sh and do it yourself manually:

```sh
# Ensure these commands doesn't fail
vagrant --version   #=> Vagrant 1.6.5
ruby --version      #=> Ruby 2.1.3
bundle --version    #=> Bundler version 1.7.3

# Install gems and cookboks
bundle install
bundle exec berks vendor cookbooks # Note `install --path` has been replaced with `vendor` as of berkshelf >= 3

# Optional if you already had on older version
vagrant plugin update vagrant-berkshelf
vagrant plugin update vagrant-omnibus

# Install necessary plugins. Ref on custom options: http://goo.gl/ce63lQ and http://goo.gl/gqMXbn
vagrant plugin install vagrant-berkshelf
#=> Installed the plugin 'vagrant-berkshelf (3.0.1)'
vagrant plugin install vagrant-omnibus
#=> Installed the plugin 'vagrant-omnibus   (1.4.1)'
```

After everything went fine start your VM:

    NODE_HOSTNAME=jenkins-master vagrant up
    #=> Thank you for installing Chef!
    #=> Machine booted and ready!

I settled Vagrant not to provision the VM so we can be flexible and start getting used to `knife solo` command.

To ssh into the VM

    NODE_HOSTNAME=jenkins-master vagrant ssh

Install chef on your target server or VM. Note `jenkins` is the hostname i'm giving to my VM for easy of use.

    bundle exec knife solo prepare jenkins --bootstrap-version 11.16.2-1

Now provision the target machine with the run_list within the node json file

    bundle exec knife solo cook jenkins nodes/jenkins.json

This final steps may take from minutes to a couple of hours. If you get a timeout error try executed the errored command by yourself on the target server. Default timeout is set to 10 minutes, if a command takes longer than that ssh into the server and run it yourself, e.g.

    # This was taking 15 minutes on a 512 DSL so had to `NODE_HOSTNAME=jenkins-master vagrant ssh` and:
    sudo apt-get -q -y install openjdk-7-jdk

Finally open your browser and visit Jenkins to verify is running:

    open http://localhost:8080

## Usage

TODO; WIP

## Requirements

- [Vagrant][] 1.4+
- [Ruby][] + [Bundler][]
- [Chef][] through [Chef-Solo][] + [Berkshelf][]
- *nix based Operating Systems (Linux, Ubuntu, Mac OSX, etc...)
- Not tested on Windows. You should at least ensure [GNU sed][] is installed.

Go [back to Installation](#installation)

## Testing

This suite uses [minitest-chef-handler][] for convergence integration testing for configuration management systems since it has a broader compatibility than [busser-bats][] through [test-kitchen][]. Why? because you can add launch the minitest [through a recipe][minitest-chef-handler#usage], thus making it compatible with [chef-solo][Chef-Solo], [chef-client][], [vagrant-chef][] and even [test-kitchen][].

So testing is performed once you add `"minitest-handler"` to your run_list. Note this is already added in the [Vagrantfile](Vagrantfile#L49) and [.kitchen.yml](.kitchen.yml#L36)

To run the test suite against multiple platforms check the [.kitchen.yml](.kitchen.yml) and enable the platforms there.
Then:

```bash
# Perform all tests automatically without destroying the VM afterwards
bundle exec kitchen test --destroy never --parallel

# Or do it step by step by yourself and one platform at a time
bundle exec kitchen create -l info
bundle exec kitchen converge -l info
bundle exec kitchen verify -l info

# Or one platform at a time
bundle exec kitchen create ubuntu-12 -l debug
bundle exec kitchen converge ubuntu-12 -l debug
bundle exec kitchen verify ubuntu-12 -l debug

# Login (ssh) into the VM called "common"
bundle exec kitchen login common

# To login manually (without kitchen magic)
ssh -p 2222 vagrant@localhost -i ~/.vagrant.d/insecure_private_key

# When you are all done, destroy the testing VM
bundle exec kitchen destroy
```

Sample ssh config `~/.ssh/config`

```bash
Host kitchen-test
  Hostname localhost
  HostKeyAlias common-ubuntu-1204-x86-64-jenkins-0
  Port 2222
  User vagrant
  IdentityFile ~/.vagrant.d/insecure_private_key
```

Then simply

```bash
ssh kitchen-test
```

The following is not necessary while using vagrant (without test-kitchen) since in your Vagrantfile this is already configured for you in this line:

```ruby
config.vm.network :forwarded_port, guest: 8080, host: 8080
```

But if playing with test-kitchen you can manually forward ports using ssh tunnels. For example to open jenkins at localhost:

```bash
# All manually
ssh -L localhost:8080:localhost:8080 -p 2222 vagrant@localhost -i ~/.vagrant.d/insecure_private_key

# Or if you have set up the suggested `~/.ssh/config` simplify the above line into this:
ssh -L localhost:8080:localhost:8080 kitchen-test
```

## Contributing

1. Fork it.
2. Make your feature addition or bug fix and create your feature branch.
3. Update the [Change Log][].
3. Add specs/tests for it. This is important so I don't break it in a future version unintentionally.
4. Commit, create a new Pull Request.
5. Check that your pull request passes the [build][travis pull requests].

## License

Released under the MIT License. See the [LICENSE][] file for further details.


[Jenkins]:    http://jenkins-ci.org/
[Vagrant]:    http://www.vagrantup.com/
[Bundler]:    http://bundler.io/
[Chef]:       http://www.opscode.com/chef/
[Chef-Solo]:  http://docs.vagrantup.com/v2/provisioning/chef_solo.html
[Berkshelf]:  http://berkshelf.com/
[Ruby]:       http://www.ruby-lang.org/
[RVM]:        http://rvm.io/
[GNU sed]:    http://gnuwin32.sourceforge.net/packages/sed.htm
[LICENSE]: LICENSE.md

[Change Log]: CHANGELOG.md

<!-- [RubyGems]: https://rubygems.org/gems/jenkins-box -->
<!-- [Documentation]: http://rubydoc.info/gems/jenkins-box -->
[Source]: https://github.com/elgalu/jenkins-box
[Bugtracker]: https://github.com/elgalu/jenkins-box/issues

[travis pull requests]: https://travis-ci.org/elgalu/jenkins-box/pull_requests

<!-- [Gem Version]: https://rubygems.org/gems/jenkins-box -->
[Build Status]: https://travis-ci.org/elgalu/jenkins-box
[Dependency Status]: https://gemnasium.com/elgalu/jenkins-box
[Code Climate]: https://codeclimate.com/github/elgalu/jenkins-box
<!-- [Coverage Status]: https://coveralls.io/r/elgalu/jenkins-box -->

<!-- [GV img]: https://badge.fury.io/rb/jenkins-box.png -->
[BS img]: https://travis-ci.org/elgalu/jenkins-box.png
[DS img]: https://gemnasium.com/elgalu/jenkins-box.png
[CC img]: https://codeclimate.com/github/elgalu/jenkins-box.png
<!-- [CS img]: https://coveralls.io/repos/elgalu/jenkins-box/badge.png?branch=master -->

[test-kitchen]: https://github.com/test-kitchen/test-kitchen
[minitest-chef-handler]: https://github.com/calavera/minitest-chef-handler
[busser-bats]: https://github.com/test-kitchen/busser-bats
[minitest-chef-handler#usage]: https://github.com/calavera/minitest-chef-handler#usage
[chef-client]: http://docs.opscode.com/chef_client.html
[vagrant-chef]: http://docs.vagrantup.com/v2/provisioning/chef_solo.html
