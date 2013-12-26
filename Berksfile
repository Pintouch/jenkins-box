# encoding: utf-8
# vi: set ft=ruby :

source 'https://api.berkshelf.com'

cookbook 'apt',        '>= 2.3'
cookbook 'yum',        '>= 2.4.2'
cookbook 'java',       '>= 1.17.3', github: 'socrata-cookbooks/java'
cookbook 'build-essential', '>= 1.4.2'
cookbook 'dmg',        '>= 2.0.8'
cookbook 'git',        '>= 2.7'
cookbook 'subversion', '>= 1.1.0'
cookbook 'curl',       '>= 1.1'
cookbook 'runit',      '>= 1.4'
cookbook 'ark',        '>= 0.4.0'
cookbook 'vim',        '>= 1.1.1', github: 'elgalu/vim', branch: 'ctags'
cookbook 'apache2',    '>= 1.8.4'
cookbook 'nginx',      '>= 2.0.4'
cookbook 'reboot',     '>= 0.0.2', github: 'elgalu/chef-reboot', branch: 'reboot_now'
cookbook 'rvm',        '>= 0.9.1', github: 'elgalu/chef-rvm', branch: 'user_from_env'
cookbook 'ruby_build', '>= 0.8.0'
cookbook 'nvm',        '>= 0.1.0'
cookbook 'jenkins',    '>= 1.2.3', github: 'elgalu/jenkins-cookbooks', branch: 'no_java'

# Testing
group :integration do
  cookbook 'minitest-handler', '>= 1.1.4'
end

metadata  # Also use metadata.rb for local recipes

# Notes
# cookbook 'java'   ==>> branch: 'better_timeout' tried to solve the default 600 seconds (10 minutes) timeout but failed
# cookbook 'reboot' ==>> branch: 'reboot_now' provides a reboot now functionality insteaf of waiting 2 minutes
# cookbook 'vim'    ==>> branch: 'ctags' fixes https://github.com/opscode-cookbooks/vim/pull/5
# cookbook 'rvm'    ==>> branch: 'gawk' fixes https://github.com/fnichol/chef-rvm/pull/213
# cookbook 'rvm'    ==>> branch: 'user_from_env' provides node['target_user'] functionality + gawk commits
# cookbook 'jenkins' =>> branch: 'no_java' avoids installing openjdk-6 since i already authered a java 7 installation
