cookbook_path    ['cookbooks', 'site-cookbooks']
node_path        'nodes'
role_path        'roles'
environment_path 'environments'
# data_bag_path    'data_bags'
# encrypted_data_bag_secret 'data_bag_key'

knife[:solo] = true
knife[:berkshelf_path] = 'cookbooks'

# To run knife solo in debug mode, pass CLI option `-V` for verbose
# knife[:log_level] = 'debug' # this doesn't work

# If you need to bootstrap an Amazon EC2 instance:
#
# Gemfile
#   gem 'chef'
#   gem 'knife-ec2' # gives knife the ability to create, bootstrap, and manage EC2 instances
# Install "Amazon EC2 API Tools"
#   http://aws.amazon.com/developertools/351
# Test. The following commands should work and provide reasonable output
#   ec2-describe-instances
#   bundle exec knife ec2 server list
# Create a 64-bit Ubuntu 12.04 AMI for the AWS. Or check http://cloud-images.ubuntu.com/releases/precise/release/
#   bundle exec knife ec2 server create -S <mykey> -I ami-3a0f034e -G default --flavor=m1.large
#   # More on this at http://www.captnswing.net/2013/01/from-vagrant-to-ec2-with-knife-solo.html
# Install cookbooks in project's sub dir
#   bundle exec berks vendor cookbooks
# Install chef on target
#   knife prepare ec2-xx-xx-xx-xx.eu-west-1.compute.amazonaws.com
# Create at least one node file, e.g.
#   vim nodes/ec2-xx-xx-xx-xx.eu-west-1.compute.amazonaws.com.json
#     { "run_list": ["recipe[mycookbook1]", "recipe[mycookbook2]", …"] }
# Finall cook the server
#   knife cook ec2-xx-xx-xx-xx.eu-west-1.compute.amazonaws.com
#
# knife[:aws_access_key_id]       = "#{ENV['AWS_ACCESS_KEY_ID']}"
# knife[:aws_secret_access_key]   = "#{ENV['AWS_SECRET_ACCESS_KEY']}"
# knife[:region]                  = "#{ENV['EC2_REGION']}"
# knife[:availability_zone]       = "#{ENV['EC2_AVAILABILITY_ZONE']}"
# knife[:ssh_user]                = "ubuntu"
# knife[:groups]                  = "default"
