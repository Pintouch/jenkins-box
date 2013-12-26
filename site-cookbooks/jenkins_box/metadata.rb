# encoding: utf-8
name             'jenkins_box'
maintainer       'Leo Gallucci'
maintainer_email 'elgalu3@gmail.com'
license          'MIT'
description      'Jenkins box ready for in-house TravisCI emulation.'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.0.1'

recipe  'jenkins_box::default',             'Does nothing'
recipe  'jenkins_box::fix-1538',            'No longer used: fix error chown: cannot access `/var/run/jenkins`: No such file or directory'
recipe  'jenkins_box::ensure-plugins',      'Install necessary plugins so the jenkins box is ready to emulate in-house TravisCI.'
recipe  'jenkins_box::replace_system_ruby', 'Replace system Ruby (probably 1.8.7) with more updated one by using ruby_build'
recipe  'jenkins_box::jenkins-upgrade',     'Upgrade Jenkins version to the latest then restart the Jenkins service.'
recipe  'jenkins_box::apt-upgrade',         'Runs sudo apt-get -y upgrade to get latest security patches'
recipe  'jenkins_box::ctags',               'Install exuberant-ctags since some cookbooks depends on it and it may fail if not correctly installed'
recipe  'jenkins_box::java-deps',           'Install some common required packages for java to avoid Mixlib::ShellOut::CommandTimeout during java sdk installation'

# ensure-plugins, jenkins-upgrade
depends 'jenkins',    '>= 1.2'
# replace_system_ruby
depends 'ruby_build', '>= 0.8.0'

# Truly tested on what can be found at file .kitchen.yml but probably this support list is accurate.
supports 'ubuntu'
supports 'debian'
supports 'centos'
supports 'amazon'
supports 'rhel'
# supports "windows" #NOT SUPPORTED due to missing `sed` cookbooks: http://community.opscode.com/cookbooks/sed
# Find the list of possible platforms at http://docs.opscode.com/dsl_recipe_method_platform_family.html#parameters
