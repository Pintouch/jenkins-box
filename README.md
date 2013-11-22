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
