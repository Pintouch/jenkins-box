source 'https://rubygems.org'

# TODO Upgrade these gems when a new version of Vagrant > 1.3.5 is shipped
#      And when they leave alpha/beta state.
# gem 'berkshelf',         '>= 3.0.0.beta3'
# gem 'vagrant-berkshelf', '>= 1.4.0.dev1'
# gem 'test-kitchen',      '>= 1.0.0.beta.4' #net-ssh dependency issue

gem 'berkshelf',         '~> 2.0'
gem 'vagrant-berkshelf', '~> 1.3'
gem 'test-kitchen',      '1.0.0.beta.3'

group :development do
  gem 'foodcritic',      '>= 3.0.3'
  gem 'rubocop',         '>= 0.15'
end

group :integration do
  gem 'kitchen-vagrant', '>= 0.11.3'
end
