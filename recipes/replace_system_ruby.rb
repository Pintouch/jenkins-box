# encoding: utf-8
#
# Author:: Leo Gallucci <elgalu3@gmail.com>
# Cookbook Name:: jenkins-box-for-travis
# Recipe:: replace_system_ruby
#
# Description: Replace system Ruby (probably 1.8.7) with more updated one by using ruby_build
#
# MIT License
#
include_recipe 'ruby_build'

node_ruby_flavor = node[:replace_system_ruby][:ruby_version]
node_prefix_path = node[:replace_system_ruby][:prefix_path]

ruby_build_ruby(node_ruby_flavor) do
  prefix_path(node_prefix_path)
  action :install
end
