# encoding: utf-8
#
# Author:: Leo Gallucci <elgalu3@gmail.com>
# Cookbook Name:: jenkins_box
# Recipe:: apt-upgrade
#
# Description: Runs sudo apt-get -y upgrade to get latest security patches
#              However, it is recommended that you perform the upgrade by yourself insteaf o using this recipe
#              since it's an error prone procedure that involves upgrading the linux kernel.
#
# MIT License
#
include_recipe 'apt'

if platform_family?('debian')

  execute 'apt-get upgrade' do
    command 'apt-get -y upgrade'
    action :run
  end

  execute 'aptitude safe-upgrade' do
    command 'aptitude -y upgrade'
    action :run
  end

  # execute 'dpkg' do
  #   command 'dpkg --configure -a'
  #   action :run
  # end

end
