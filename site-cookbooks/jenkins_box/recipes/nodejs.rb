# encoding: utf-8
#
# Author:: Leo Gallucci <elgalu3@gmail.com>
# Cookbook Name:: jenkins_box
# Recipe:: nodejs
#
# Description: Install nvm (node version manager) and nodejs
#
# MIT License
#
include_recipe 'nvm'

nodejs_version = node[:nodejs][:version] || (fail 'Need an specific nodejs version to install within node[:nodejs][:version]')

nvm_install "v#{nodejs_version}"  do
  from_source false
  alias_as_default true
  action :create
end
