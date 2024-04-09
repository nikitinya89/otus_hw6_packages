#!/bin/bash
sudo yum install -y redhat-lsb-core wget rpmdevtools rpm-build createrepo yum-utils gcc
wget https://nginx.org/packages/centos/7/SRPMS/nginx-1.14.1-1.el7_4.ngx.src.rpm
sudo rpm -i nginx-1.14.1-1.el7_4.ngx.src.rpm
wget https://github.com/openssl/openssl/archive/refs/heads/OpenSSL_1_1_1-stable.zip
sudo unzip OpenSSL_1_1_1-stable.zip -d /root/
sudo yum-builddep -y /root/rpmbuild/SPECS/nginx.spec
sudo mv /vagrant/nginx.spec /root/rpmbuild/SPECS/nginx.spec
sudo rpmbuild -bb /root/rpmbuild/SPECS/nginx.spec
sudo yum localinstall -y /root/rpmbuild/RPMS/x86_64/nginx-*
sudo systemctl enable --now nginx
sudo cp /vagrant/otus.repo /etc/yum.repos.d/