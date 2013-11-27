#!/usr/bin/env ruby
# vi: set ft=ruby :

site :opscode # Still using this deprecated site location until vagrant is upgraded
# with the usage of:
# source "https://api.berkshelf.com"

# Accessory recipes
cookbook 'apt',        '>= 2.3'
cookbook 'yum',        '>= 2.4.2'
cookbook 'java',       '>= 1.15.4'
cookbook 'build-essential', '>= 1.4.2'
cookbook 'dmg',        '>= 2.0.8'
cookbook 'git',        '>= 2.7'
cookbook 'subversion', '>= 1.1.0'
cookbook 'curl',       '>= 1.1'
cookbook 'runit',      '>= 1.4'
cookbook 'ark',        '>= 0.4.0'
cookbook 'vim'
cookbook 'apache2',    '>= 1.8.4'
cookbook 'nginx',      '>= 2.0.4'

# Intended recipes
cookbook 'jenkins',    '>= 1.2.2'
cookbook 'rvm',        '>= 0.9.1', github: 'elgalu/chef-rvm', branch: :gawk # To fix https://github.com/fnichol/chef-rvm/pull/213
cookbook 'ruby_build', '>= 0.8.0'

# Testing
group :integration do
  cookbook 'minitest-handler', '>= 1.1.4'
end

# TODO: To achieve as close as possible TravisCI environment, i may need to check these:
#   https://github.com/travis-ci/travis-cookbooks/tree/master/ci_environment
#   http://about.travis-ci.org/fr/docs/user/ci-environment/
# More recipes to consider:
#   https://github.com/michaelklishin/sous-chef/blob/master/Vagrantfile.sample
# Alternative sources
# cookbook 'rvm',        '>= 0.9.1', github: 'fnichol/chef-rvm', ref: '0cd320911'
# cookbook 'ruby_build', '>= 0.8.1', github: 'fnichol/chef-ruby_build', ref: '4d3361995'

metadata  # Also use metadata.rb for local recipes
