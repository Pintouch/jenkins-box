# Configuration File For Chef Solo (chef-solo)
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

log_location       STDOUT #"/var/log/chef/solo.log"

# The location in which role files are located. Default value: /var/chef/roles.
role_path 'roles'

# file_cache_path specifies where solo should look for the cookbooks to use
# valid value is any filesystem directory location. This is slightly
# different from 'normal' client mode as solo is actually downloading (or
# using) the specified cookbooks in this location.
# file_cache_path    "/var/chef/cache"

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
# Corresponds to chef-solo -j
# json_attribs "/var/tmp/node.json"
# json_attribs "http://www.example.com/chef/node.json"
