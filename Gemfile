source "file://#{File.expand_path('.')}/chef-11.10.0.alpha.1" # Until the upgraded version is released with the json dependency patch
source 'https://rubygems.org'

gem 'berkshelf',         '>= 3.0.0.beta4'
gem 'vagrant-berkshelf', '>= 1.4.0.dev1'
gem 'ohai', '>= 6.20.0'
gem 'chef', '11.10.0.alpha.1' # Use this until this commit is included in a release: https://github.com/opscode/chef/commit/1417e6c7a28
gem 'knife-solo',        '>= 0.4.1'
gem 'yajl-ruby',         '>= 1.2.0'

group :test do
  gem 'foodcritic',      '>= 3.0.3', github: 'elgalu/foodcritic', branch: 'relax_yajl-ruby'
  gem 'rubocop',         '>= 0.15'
end

group :integration do
  gem 'test-kitchen',      '~> 1.1', '>= 1.1.1'
  gem 'kitchen-vagrant', '~> 0.14'
  gem 'minitest-chef-handler', '>= 1.0.1'
end

group :development do
  gem 'pry'
  gem 'pry-doc'
  gem 'pry-stack_explorer'
  gem 'pry-rescue'
end
