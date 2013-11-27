# encoding: utf-8
#!/usr/bin/env ruby
# vi: set ft=ruby :

Vagrant.configure('2') do |config|
  config.vm.hostname = 'jenkins-box-for-travis' # Set this in your /etc/hosts

  # You can start off using a VagrantUp.com provided box if you don't yet trust my uploaded base-jenkins-precise64-0.box
  # config.vm.box = 'precise64' # All vagrant VMs require a box to build off of.
  # config.vm.box_url = 'http://files.vagrantup.com/precise64.box' # Fetch from here if doesn't exist on the file system

  # Packages where built using `vagrant package` e.g. below. Ref at: http://docs-v1.vagrantup.com/v1/docs/getting-started/packaging.html
  #   vagrant up
  #   vagrant package --output mytmp.box
  #   vagrant box add base-jenkins-precise64-0 mytmp.box
  # Packages where uploaded to sourceforge.net. Ref: http://goo.gl/0T13PI  Upload limits: http://goo.gl/pe2uOy
  #   rsync -avP -e ssh mytmp.box elgalu@frs.sourceforge.net:/home/frs/project/jenkins-box/0.1.0/
  #   mv mytmp.box base-jenkins-precise64-0.box
  #   mv base-jenkins-precise64-0.box /media/user/Datos/VirtualBox/vagrant_boxes/
  # Ubuntu 12.04 64 (precise64) vagrant machines:
  #   base-jenkins-precise64-0 : http://sourceforge.net/projects/jenkins-box/files/0.1.0/base-jenkins-precise64-0.box/download
  #     based on: precise64 (http://files.vagrantup.com/precise64.box)
  #     added...: jenkins 1.540, openjdk7, build-essential, curl, runit, ark, vim
  config.vm.box = 'base-jenkins-precise64-0'
  config.vm.box_url = "http://sourceforge.net/projects/jenkins-box/files/0.1.0/#{config.vm.box}.box/download"

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
    chef.add_recipe 'minitest-handler' # for testing
  end
end
