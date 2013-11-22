#!/usr/bin/env ruby
# vi: set ft=ruby :

Vagrant.configure('2') do |config|
  config.vm.hostname = 'jenkins-box-for-travis' # Set this in your /etc/hosts
  config.vm.box = 'precise64' # All vagrant VMs require a box to builld off of.
  # Fetch from here if doesn't exist on the file system
  config.vm.box_url = 'http://files.vagrantup.com/precise64.box'

  # Enable plugin. Note globally is done at ~/.vagrant.d/Vagrantfile
  config.berkshelf.enabled = true

  # Assign this VM to a host-only network IP. Unaccessible from external nets
  # config.vm.network :private_network, ip: "33.33.33.10"
  # Or use public (bridged) network to make it appear as another real device
  # config.vm.network :public_network
  # Share additional folders to the guest VM. First arg is path on host machine
  # config.vm.synced_folder "../data", "/vagrant_data"

  # Forward jenkins port
  config.vm.network :forwarded_port, guest: 8080, host: 8080

  # This is important to avoid bugs in case an older version of chef is already instaled in the pre-packaged box or machine
  # http://stackoverflow.com/questions/11325479/how-to-control-the-version-of-chef-that-vagrant-uses-to-provision-vms#answer-18213542
  config.omnibus.chef_version = :latest

  config.vm.provision :chef_solo do |chef|
    chef.log_level = :debug
    chef.roles_path = 'roles'
    chef.add_role 'base'
  end
end
