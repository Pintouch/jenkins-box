#!/usr/bin/env ruby
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.hostname = "jenkins-box-for-travis" #set this in your /etc/hosts
  config.vm.box = "precise64" #all vagrant VMs require a box to builld off of.
  # Fetch from here if doesn't exist on the file system
  config.vm.box_url = "http://files.vagrantup.com/precise64.box"

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

  config.vm.provision :chef_solo do |chef|
    chef.json = {
      'rvm' => { 'user_installs' =>
        [
         { 'user' => 'vagrant',
           # Force empty global gems to avoid rbx error while installs bundler
           'global_gems' => [],
           'rubies' => ['2.0.0', '1.9.3', 'jruby', 'ree-1.8.7', 'rbx-2.1.1'],
           'default_ruby' => '2.0.0' }
        ]
      },
      'jenkins' => { 'server' =>
        { 'plugins' => %w(git github rake rvm ruby-runtime) }
      }
    }

    chef.run_list = [
      'recipe[apt]',
      'recipe[build-essential]',
      'recipe[git]',
      'recipe[curl]',
      'recipe[runit]',
      'recipe[java]',
      'recipe[rvm::user]', 'recipe[rvm::vagrant]',
      'recipe[jenkins]',
      'recipe[jenkins-box-for-travis::fix-1538]',
      'recipe[jenkins::server]',
      'recipe[jenkins-box-for-travis::ensure-plugins]'
    ]

    # Notes on decided run_list
    # recipe[rvm::vagrant] can help resolving the chef-solo binary on
    #  subsequent `vagrant provision` executions.
    # recipe[jenkins-box-for-travis::fix-1538] fixes error for non-existing dir
    #  /var/run/jenkins see https://issues.jenkins-ci.org/browse/JENKINS-20407
    # recipe[rvm::gem_package] idk if this worth using
    # recipe[rvm::system] nope; using rvm::user instead of this wide install
  end
end
