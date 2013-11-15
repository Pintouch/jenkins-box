# Jenkins Box for Travis

TODO Badges

## Description

Jenkins box ready for in-house TravisCI emulation.

Helps you build a local VM for ruby development by using [Vagrant][] + [Chef-Solo][]

## Features

- [Jenkins][] with port forwarding to port 8080
- Build [Ruby][] projects using [RVM][]

## Installation

Ensure you meet the [requirements](#Requirements) then automatically verify and install by using the bootstrap script:

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
```

After everything went fine start your VM:

    vagrant up

This final step may take from minutes to a couple of hours.

Then open your browser and visit Jenkins to verify is running:

    open http://localhost:8080

## Usage

TODO

## Requirements

- [Vagrant][] 1.3+
- [Ruby][] + [Bundler][]
- [Chef][] through [Chef-Solo][] + [Berkshelf][]
- *nix based Operating Systems (Linux, Ubuntu, Mac OSX, etc...)
- Not tested on Windows. You should at least ensure [GNU sed][] is installed.

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
