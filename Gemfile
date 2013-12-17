source "file://#{File.expand_path('.')}/chef-11.10.0.dev.2" # Until the upgraded version is released with the json dependency patch
source 'https://rubygems.org'

gem 'berkshelf',         '>= 3.0.0.beta4'
gem 'vagrant-berkshelf', '>= 1.4.0.dev1'

group :test do
  gem 'foodcritic',      '>= 3.0.3'
  gem 'rubocop',         '>= 0.15'
end

group :integration do
  gem 'test-kitchen',      '~> 1.1', '>= 1.1.1'
  gem 'kitchen-vagrant', '~> 0.14'
  gem 'chef', '11.10.0.dev.2' # Use this until this commit is included in a release: https://github.com/opscode/chef/commit/1417e6c7a28
  gem 'ohai', '>= 6.20.0' #tested
  gem 'minitest-chef-handler', '>= 1.0.1'
end
