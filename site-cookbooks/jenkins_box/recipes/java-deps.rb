# encoding: utf-8
#
# Author:: Leo Gallucci <elgalu3@gmail.com>
# Cookbook Name:: jenkins_box
# Recipe:: java-deps
#
# Description: Install some common required packages for java to avoid Mixlib::ShellOut::CommandTimeout during java sdk installation
#
# MIT License
#

deps = %w(
consolekit
cryptsetup-bin
dconf-gsettings-backend
fontconfig
fontconfig-config
gconf-service
gconf2
gvfs
libasound2
libasyncns0
libavahi-glib1
libbonobo2-0
libcanberra0
libgconf2-4
libgif4
libgtk2.0-0
libice-dev
libjson0
liblcms2-2
libnspr4
libnss3
libnss3-1d
libpcsclite1
libpthread-stubs0
libpthread-stubs0-dev
libpulse0
libsm-dev
libxau-dev
libxcb1-dev
libxt-dev
ttf-dejavu-extra
libgnome2-0
libgnomevfs2-0
)

if platform_family?('debian')
  deps.each do |dep|
    instance_eval <<-PACKAGE
      package '#{dep}' do
        action :install
      end
    PACKAGE
  end
end
