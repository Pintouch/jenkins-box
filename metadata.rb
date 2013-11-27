name             'jenkins-box-for-travis'
maintainer       'Leo Gallucci'
maintainer_email 'elgalu3@gmail.com'
license          'MIT'
description      'Jenkins box ready for in-house TravisCI emulation.'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.0.1'

recipe  'jenkins-box-for-travis::default',             'Does nothing'
recipe  'jenkins-box-for-travis::fix-1538',            'No longer used: fix error chown: cannot access `/var/run/jenkins`: No such file or directory'
recipe  'jenkins-box-for-travis::ensure-plugins',      'Install necessary plugins so the jenkins box is ready to emulate in-house TravisCI.'
recipe  'jenkins-box-for-travis::replace_system_ruby', 'Replace system Ruby (probably 1.8.7) with more updated one by using ruby_build'

# ensure-plugins
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
