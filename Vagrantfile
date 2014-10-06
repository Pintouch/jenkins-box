# encoding: utf-8
# vi: set ft=ruby :

Vagrant.require_version ">= 1.4.1"

Vagrant.configure('2') do |config|
  # Set the hostname in your `etc/hosts` if it's not a fqdn, e.g. 'jenkins-master'
  config.vm.hostname = ENV['NODE_HOSTNAME'] || (fail "Need the environment variable NODE_HOSTNAME to be set, e.g. \`NODE_HOSTNAME=jenkins-master vagrant up\`")

  # Ubuntu Server Precise 12.04.3 amd64 ; Kernel is ready for Docker (Docker not included)
  config.vm.box = 'ubuntu_12.04.3_amd64'
  config.vm.box_url = 'http://nitron-vagrant.s3-website-us-east-1.amazonaws.com/vagrant_ubuntu_12.04.3_amd64_virtualbox.box'

  # You can start off using a VagrantUp.com provided box if you don't yet trust my uploaded base-jenkins-precise64-0.box
  # config.vm.box = 'ubuntu/trusty64' # Find more at https://vagrantcloud.com/ubuntu/boxes/trusty64
  # config.vm.box_url = 'https://vagrantcloud.com/ubuntu/trusty64' # Fetch from here if doesn't exist on the file system

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
  # config.vm.box = 'base-jenkins-precise64-0'
  # config.vm.box_url = "http://sourceforge.net/projects/jenkins-box/files/0.1.0/#{config.vm.box}.box/download"

  # Assign this VM to a host-only network IP. Unaccessible from external nets
  # config.vm.network :private_network, ip: "33.33.33.10"
  # Or use public (bridged) network to make it appear as another real device
  # config.vm.network :public_network
  # Share additional folders to the guest VM. First arg is path on host machine
  # config.vm.synced_folder "../data", "/vagrant_data"

  # Forward jenkins port
  config.vm.network :forwarded_port, guest: 8080, host: 8080

  # I no longer provision through vagrant to avoid the magic and have
  # a common deployment strategy through knife-solo.
  #
  # Enable plugin. Note globally is done at ~/.vagrant.d/Vagrantfile
  # config.berkshelf.enabled = true
  #
  # This is important to avoid bugs in case an older version of chef is already instaled in the pre-packaged box or machine
  # http://stackoverflow.com/questions/11325479/how-to-control-the-version-of-chef-that-vagrant-uses-to-provision-vms#answer-18213542
  # config.omnibus.chef_version = :latest
  #
  # config.vm.provision :chef_solo do |chef|
  #   #chef.node_name = config.vm.hostname
  #   #chef.cookbooks_path = ["site-cookbooks", "cookbooks"]
  #   chef.log_level = :info # :info, :debug
  #   chef.roles_path = 'roles'
  #   #chef.data_bags_path = "data_bags"
  #   chef.add_role 'base'
  #   chef.add_role 'master'
  #   # Add testing recipe at the end
  #   chef.add_recipe 'minitest-handler'
  # end
end
