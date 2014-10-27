# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  config.vm.box = "ubuntu/trusty64"

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine. In the example below,
  # accessing "localhost:8080" will access port 80 on the guest machine.
  # config.vm.network :forwarded_port, guest_ip: "127.0.0.1", guest: 5432, host: 5432
  # config.vm.network :forwarded_port, guest_ip: "127.0.0.1", guest: 8888, host: 8888
  # config.vm.network :forwarded_port, guest_ip: "127.0.0.1", guest: 9000, host: 9000

  # Create a private network, which allows host-only access to the machine
  # using a specific IP.
  config.vm.network "private_network", ip: "192.168.7.7"

  # Create a public network, which generally matched to bridged network.
  # Bridged networks make the machine appear as another physical device on
  # your network.
  config.vm.network "public_network"
  config.vm.hostname = "lilswap"

  config.vm.synced_folder "src/", "/home/vagrant/src"

  config.vm.provider :virtualbox do |vb|
    vb.customize [
      "modifyvm", :id,
      "--cpus", 2,
      "--memory", 2048
    ]
  end

  config.vm.provision :shell, :privileged => false, :path => "bootstrap.sh"

end
