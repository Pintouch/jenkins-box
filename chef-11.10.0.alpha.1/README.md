# How to build this

Within your project root path

    mkdir -p chef-11.10.0.alpha.1/gems

Go to an empty directory then

    git clone https://github.com/opscode/chef.git
    cd chef
    git checkout 7322db42 -b my_alpha
    gem build chef.gemspec
    mv *.gem {your_project_path}/chef-11.10.0.alpha.1/gems

Go back to your project root path then

    cd chef-11.10.0.alpha.1
    gem generate_index

Add this to your project Gemfile

    source "file://#{File.expand_path('.')}/chef-11.10.0.alpha.1"
    source 'https://rubygems.org'

    gem 'chef', '11.10.0.alpha.1'

