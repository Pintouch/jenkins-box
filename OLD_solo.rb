# encoding: utf-8
#
# This file is no longer necessary nor recommended.
#
# Configuration File For Chef Solo (chef-solo)
# root_path = File.expand_path('..', __FILE__)

# Example Usage (needs to be logged into the target server)
#   # Not recommended. Try using knife instead. See below.
#   sudo chef-solo -c solo.rb -j roles/jenkins_master.json
#
# Example Usage (from your dev machine using kife-solo)
#
#   Knife Solo Setup
#     # Ensure you are using a proper knife-solo binary
#     echo "gem 'knife-solo'" >> Gemfile && bundle install
#
#     # Install Chef on a given host. Configure ssh credentials in your `~/.ssh/config`
#     bundle exec knife solo prepare user@server-host.com --bootstrap-version 11.8.2-1
#
#     # Note `knife solo bootstrap` performs `prepare` + `cook` in one command
#     # On Windows setup ssh and the other required tools:
#     + WinSSHd
#     + https://github.com/thbar/rsync-windows
#     + http://www.opscode.com/chef/install.msi
#
#   Knife Solo Usage
#     # Short version
#     vagrant up
#     # Recommended: manually perform the following commands before continuing:
#     #   sudo apt-get -y update
#     #   sudo apt-get -y upgrade
#     #   sudo aptitude -y upgrade
#     bek prepare jenkins --bootstrap-version 11.8.2-1
#     bek cook jenkins nodes/jenkins.json
#
#     # First run the upgrade separately because it requires machine reboot
#     bundle exec knife solo cook jenkins roles/upgraded.json
#
#     # Set the user name on the target system. If using Vagrant the should be "vagrant" but may differ in other infrastructure
#     TARGET_USER="vagrant" && JSON_ATTRS="{\"rvm\":{\"target_user\":\"${TARGET_USER}\"},\"users\":[\"${TARGET_USER}\"],\"jenkins\":{\"server\":{\"user\":\"${TARGET_USER}\"}}}"
#     # TARGET_USER="vagrant" && JSON_ATTRS="{\"rvm\":{\"user_installs\":[{\"user\":\"${TARGET_USER}\"}]},\"jenkins\":{\"server\":{\"user\":\"${TARGET_USER}\"}}}"
#     # Upload the current kitchen (Chef repo) to the target host and run chef-solo on that host
#     bundle exec knife solo cook user@server-host.com nodes/jenkins_master.json -j $JSON_ATTRS
#     # Extra example given `alias bek='bundle exec knife solo'`
#     bek cook jenkins nodes/jenkins.json -j $JSON_ATTRS
#
#   Knife solo security
#     # After cooking a target server it is convenient to clean up the server from saved cook passwords and more
#     bundle exec knife solo clean user@server-host.com
#
#   To start a knife-solo project:
#     bundle exec knife solo init .
#
# This file is added for documentation purposes.
#
# The program chef-solo allows you to run Chef as a standalone program without connecting to a remote Chef Server.
#
# When invoked without the -c option, chef-solo reads this file by default, otherwise it reads the specified file for configuration.
#
# Sample usage:
# sudo chef-solo -c solo.rb -j roles/jenkins-travis.json
#
# It is a Ruby DSL config file, and can embed regular Ruby code in addition to the configuration settings. Some settings use Ruby symbols, which are a value
# that starts with a colon. In Ruby, anything but 'false' or 'nil' is true. To set something to false: `some_setting false
#
# log_level specifies the level of verbosity for output. valid values are: :debug, :info, :warn, :error, :fatal
# Corresponds to chef-solo -l

log_level          :debug

# log_location specifies where the client should log to.
# valid values are: a quoted string specifying a file, or STDOUT with no quotes.
# Corresponds to chef-solo -L

log_location       STDOUT # "/var/log/chef/solo.log"

# The location in which role files are located. Default value: /var/chef/roles.
role_path 'roles'

# file_cache_path specifies where solo should look for the cookbooks to use
# Valid value is any filesystem directory location. This is slightly
# different from 'normal' client mode as solo is actually downloading (or
# using) the specified cookbooks in this location.
file_cache_path '.'

# cookbook_path specifies where solo should look for cookbooks it will use.
# valid value is a string, or array of strings of filesystem directory locations.
# This setting is similar to the server setting of the same name. Solo will use
# this as a search location, in Array order. It should be a subdirectory of
# file_cache_path, above.
# cookbook_path      [ "/home/elgalu/install/cookbooks", "/home/elgalu/install/vendor/cookbooks" ]

# recipe_url specifies a remote URL to retrieve a tarball of cookbooks.
# Corresponds to chef-solo -r
# recipe_url "http://www.example.com/chef/cookbooks.tar.gz"

# json_attribs specifies a local or remote JSON data file that specifies attributes and a run_list that Chef will use to configure the system.
# Use this option to override attributes that are set from other locations, such as from within a cookbook or by a role.
# To be used with `chef-solo -j`
# json_attribs "/var/tmp/node.json"
# json_attribs "http://www.example.com/chef/node.json"

# use the data_bag() and data_bag_item() functions to access data bags and data bag items
# data_bag_path 'data_bags'
# TODO: https://github.com/thbishop/knife-solo_data_bag
