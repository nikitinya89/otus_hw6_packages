# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "centos/7"

ssh_pub_key = File.readlines("../id_rsa.pub").first.strip

config.vm.provision "shell", inline: <<-SHELL
  echo #{ssh_pub_key} >> ~vagrant/.ssh/authorized_keys
  echo #{ssh_pub_key} >> ~root/.ssh/authorized_keys
  sudo sed -i 's/\#PasswordAuthentication no/PasswordAuthentication yes/g' /etc/ssh/sshd_config
  systemctl restart sshd
SHELL

config.vm.provision "shell", name:"rpm", path:"rpm.sh", run:"once"
config.vm.provision "shell", name:"repo", path:"repo.sh", run:"once"

config.vm.network "private_network", ip: "192.168.111.11", adapter: 2, netmask: "255.255.255.0", virtualbox__intnet: "mynet"
config.vm.network "forwarded_port", guest:80, host: 8888
end