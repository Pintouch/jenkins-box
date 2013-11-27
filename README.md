# Jenkins Box for Travis

[![Build Status][BS img]][Build Status]
[![Dependency Status][DS img]][Dependency Status]
[![Code Climate][CC img]][Code Climate]

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
vagrant --version   #=> Vagrant 1.3.5
ruby --version      #=> Ruby 2.0.0
bundle --version    #=> Bundler version 1.3.4
chef-solo --version #=> Chef: 11.8.0

# Install the rest
bundle install
bundle exec berks install
vagrant plugin install vagrant-berkshelf
vagrant plugin install vagrant-omnibus
```

After everything went fine start your VM:

    vagrant up

This final step may take from minutes to a couple of hours.

Then open your browser and visit Jenkins to verify is running:

    open http://localhost:8080

## Usage

TODO; WIP/

## Requirements

- [Vagrant][] 1.3+
- [Ruby][] + [Bundler][]
- [Chef][] through [Chef-Solo][] + [Berkshelf][]
- *nix based Operating Systems (Linux, Ubuntu, Mac OSX, etc...)
- Not tested on Windows. You should at least ensure [GNU sed][] is installed.

## Testing

This suite uses [minitest-chef-handler][] for convergence integration testing for configuration management systems since it has a broader compatibility than [busser-bats][] through [test-kitchen][]. Why? because you can add launch the minitest [through a recipe][minitest-chef-handler#usage], thus making it compatible with [chef-solo][Chef-Solo], [chef-client][], [vagrant-chef][] and even [test-kitchen][].

So testing is performed once you add `"minitest-handler"` to your run_list. Note this is already added in the [Vagrantfile](Vagrantfile#L47) and [.kitchen.yml](.kitchen.yml#L37)

To run the test suite against multiple platforms check the [.kitchen.yml](.kitchen.yml) and enable the platforms there.
Then:

```bash
# Perform all tests automatically without destroying the VM after success
bundle exec kitchen test --destroy never --parallel

# Or do it step by step by yourself
bundle exec kitchen create -l debug
bundle exec kitchen converge -l debug
bundle exec kitchen verify -l debug

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

<!-- [RubyGems]: https://rubygems.org/gems/jenkins-box-for-travis -->
<!-- [Documentation]: http://rubydoc.info/gems/jenkins-box-for-travis -->
[Source]: https://github.com/elgalu/jenkins-box-for-travis
[Bugtracker]: https://github.com/elgalu/jenkins-box-for-travis/issues

[travis pull requests]: https://travis-ci.org/elgalu/jenkins-box-for-travis/pull_requests

<!-- [Gem Version]: https://rubygems.org/gems/jenkins-box-for-travis -->
[Build Status]: https://travis-ci.org/elgalu/jenkins-box-for-travis
[Dependency Status]: https://gemnasium.com/elgalu/jenkins-box-for-travis
[Code Climate]: https://codeclimate.com/github/elgalu/jenkins-box-for-travis
<!-- [Coverage Status]: https://coveralls.io/r/elgalu/jenkins-box-for-travis -->

<!-- [GV img]: https://badge.fury.io/rb/jenkins-box-for-travis.png -->
[BS img]: https://travis-ci.org/elgalu/jenkins-box-for-travis.png
[DS img]: https://gemnasium.com/elgalu/jenkins-box-for-travis.png
[CC img]: https://codeclimate.com/github/elgalu/jenkins-box-for-travis.png
<!-- [CS img]: https://coveralls.io/repos/elgalu/jenkins-box-for-travis/badge.png?branch=master -->

[test-kitchen]: https://github.com/test-kitchen/test-kitchen
[minitest-chef-handler]: https://github.com/calavera/minitest-chef-handler
[busser-bats]: https://github.com/test-kitchen/busser-bats
[minitest-chef-handler#usage]: https://github.com/calavera/minitest-chef-handler#usage
[chef-client]: http://docs.opscode.com/chef_client.html
[vagrant-chef]: http://docs.vagrantup.com/v2/provisioning/chef_solo.html
