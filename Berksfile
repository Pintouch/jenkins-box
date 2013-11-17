#!/usr/bin/env ruby
# vi: set ft=ruby :

site :opscode # Still using this deprecated site location until vagrant is upgraded
# with the usage of:
# source "https://api.berkshelf.com"

# Accessory recipes
cookbook 'apt',     '>= 2.3'
cookbook 'build-essential', '>= 1.4.2'
cookbook 'dmg',     github: 'thomasmeeus/dmg', ref: '03cf303258' # To temporary fix https://tickets.opscode.com/browse/COOK-3946
cookbook 'git',     '>= 2.7'
cookbook 'curl',    '>= 1.1'
cookbook 'runit',   '>= 1.4'
cookbook 'apache2', '>= 1.8.4'
cookbook 'nginx',   '>= 2.0.4'
cookbook 'java',    '>= 1.15.4'

# Intended recipes
cookbook 'jenkins', '>= 1.2.2'
cookbook 'rvm',     github: 'elgalu/chef-rvm', branch: :gawk # To temporary fix https://github.com/fnichol/chef-rvm/pull/213

metadata  # Also use metadata.rb for local recipes
