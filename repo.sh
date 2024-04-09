#!/bin/bash
sudo mkdir /usr/share/nginx/html/repo
sudo cp /root/rpmbuild/RPMS/x86_64/nginx-1.14.1-1.el7_4.ngx.x86_64.rpm /usr/share/nginx/html/repo/
sudo createrepo /usr/share/nginx/html/repo/
sudo mv /vagrant/default.conf /etc/nginx/conf.d/default.conf
sudo chown root:root /etc/nginx/conf.d/default.conf
sudo setenforce 0
nginx -s reload