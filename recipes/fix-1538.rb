#
# Author:: Leo Gallucci <elgalu3@gmail.com>
# Cookbook Name:: jenkins-box-for-travis
# Recipe:: fix-1538
#
# Description: Fix error chown: cannot access `/var/run/jenkins`: No such file or directory
#              https://issues.jenkins-ci.org/browse/JENKINS-20407
#
# MIT License (2013)
#
include_recipe 'jenkins'

# First ensure the jenkins user exists
user node[:jenkins][:server][:user] do
  home node[:jenkins][:server][:home]
end

# Now the fix. Ensure /var/run/jenkins directory exists
directory '/var/run/jenkins' do
  owner node[:jenkins][:server][:user]
  group node[:jenkins][:server][:group]
  mode  node[:jenkins][:server][:dir_permissions]
  action :create
end
