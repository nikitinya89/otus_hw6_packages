# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "centos/7"

config.vm.provision "shell", name:"rpm", path:"rpm.sh", run:"once"
config.vm.provision "shell", name:"repo", path:"repo.sh", run:"once"

config.vm.network "private_network", ip: "192.168.111.11", adapter: 2, netmask: "255.255.255.0", virtualbox__intnet: "mynet"
config.vm.network "forwarded_port", guest:80, host: 8888
end
