# encoding: utf-8
#
# Author:: Leo Gallucci <elgalu3@gmail.com>
# Cookbook Name:: jenkins_box
# Recipe:: ctags
#
# Description: Install exuberant-ctags since some cookbooks depends on it and it may fail if not correctly installed
#
# MIT License
#

if platform_family?('debian')
  package 'exuberant-ctags' do
    action :install
  end
end
