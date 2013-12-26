# encoding: utf-8
#
# Author:: Leo Gallucci <elgalu3@gmail.com>
# Cookbook Name:: jenkins_box
# Recipe:: jenkins-upgrade
#
# Description: Upgrade Jenkins version to the latest then restart the Jenkins service.
#
# MIT License
#
include_recipe 'jenkins'

package 'jenkins' do
  action :upgrade
end

service 'jenkins' do
  action :restart
end
