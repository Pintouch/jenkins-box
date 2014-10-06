# source "file://#{File.expand_path('.')}/chef-11.10.0.alpha.1" # Until the upgraded version is released with the json dependency patch
source 'https://rubygems.org'

gem 'berkshelf',         '>= 3.1.5'
gem 'vagrant-berkshelf', '>= 3.0.1'
gem 'ohai', '>= 7.4.0'
gem 'chef', '~> 11.16', '>= 11.16.2'
gem 'knife-solo',        '>= 0.4.2'
gem 'yajl-ruby',         '>= 1.2.1'

group :test do
  # gem 'foodcritic',      '>= 3.0.3', github: 'elgalu/foodcritic', branch: 'relax_yajl-ruby'
  gem 'foodcritic',      '>= 4.0.0'
  gem 'rubocop',         '>= 0.26.1'
end

group :integration do
  gem 'test-kitchen',      '~> 1.2', '>= 1.2.1'
  gem 'kitchen-vagrant', '~> 0.15'
  gem 'minitest-chef-handler', '>= 1.0.3'
end

group :development do
  gem 'pry'
  gem 'pry-doc'
  gem 'pry-stack_explorer'
  gem 'pry-rescue'
end
