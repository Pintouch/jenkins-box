# encoding: utf-8
# vi: set ft=ruby :

source 'https://api.berkshelf.com'

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
cookbook 'rvm',        '>= 0.9.1', github: 'elgalu/chef-rvm', branch: :gawk # Fixes https://github.com/fnichol/chef-rvm/pull/213
cookbook 'ruby_build', '>= 0.8.0'

# Testing
group :integration do
  cookbook 'minitest-handler', '>= 1.1.4'
end

metadata  # Also use metadata.rb for local recipes
