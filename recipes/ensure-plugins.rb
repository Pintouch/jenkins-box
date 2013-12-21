# encoding: utf-8
#
# Author:: Leo Gallucci <elgalu3@gmail.com>
# Cookbook Name:: jenkins-box-for-travis
# Recipe:: ensure-plugins
#
# Description: Install necessary plugins to run the same that can be run on TravisCI
#              The current opscode jenkins recipe failed to install the plugins so this recipe to the rescue.
#
# MIT License
#
include_recipe 'jenkins'

jenkins_box = 'jenkins-box-for-travis'.to_sym
plugins_to_install = node[jenkins_box][:server][:plugins]

# Ensure jenkins user home dir exists
directory node[:jenkins][:server][:home] do
  owner node[:jenkins][:server][:user]
  group node[:jenkins][:server][:group]
  action :create
end

# Fixes possible error:
#   STDOUT: `git` is neither a valid file, URL, nor a plugin artifact name in the update center
#   No update center data is retrieved yet from: http://updates.jenkins-ci.org/update-center.json
directory "#{node[:jenkins][:server][:home]}/updates" do
  owner node[:jenkins][:server][:user]
  group node[:jenkins][:server][:group]
  action :create
end

remote_file "#{node[:jenkins][:server][:home]}/updates/default-temp.json" do
  source 'http://updates.jenkins-ci.org/update-center.json'
  owner node[:jenkins][:server][:user]
  group node[:jenkins][:server][:group]
end

# TODO: This script depends on `sed` which currently no cookbook is available: http://community.opscode.com/cookbooks/sed
execute 'update jenkins update center' do
  # command "wget http://updates.jenkins-ci.org/update-center.json -qO- | sed '1d;$d'  > #{node[:jenkins][:server][:home]}/updates/default.json"
  command "sed '1d;$d' #{node[:jenkins][:server][:home]}/updates/default-temp.json > #{node[:jenkins][:server][:home]}/updates/default.json"
  user node[:jenkins][:server][:user]
  group node[:jenkins][:server][:group]
  creates "#{node[:jenkins][:server][:home]}/updates/default.json"
end

# Avoid installing plugins that are already installed
installed_plugins = 0
plugins_dir = File.join(node[:jenkins][:server][:home], 'plugins')
plugin_exists = proc { |name| ::File.exists? File.join(plugins_dir, "#{name}.jpi") }

plugins_to_install.each do |plugin|
  jenkins_cli "install plugin #{plugin}" do
    # timeout 1800 # http://goo.gl/7C5CUc && http://goo.gl/JAEhDm
    command "install-plugin #{plugin}"
    installed_plugins += 1 unless plugin_exists.call(plugin)
    not_if { plugin_exists.call(plugin) }
  end
end

jenkins_cli 'safe-restart' do
  command 'safe-restart'
  only_if { installed_plugins > 0 }
end
