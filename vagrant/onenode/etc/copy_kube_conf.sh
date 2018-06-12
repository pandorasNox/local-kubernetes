#!/bin/sh

mkdir kubernetes || true
mkdir kubernetes/.kube || true
scp -i .vagrant/machines/monovagk8s/virtualbox/private_key vagrant@172.17.8.201:/home/vagrant/.kube/config kubernetes/.kube/config
#server: https://10.0.2.15:6443
# sed "s/server=.*/server: https://172.17.8.201:6443/g" 
# sed -i "/server=/c\\\server: https:\\172.17.8.201:6443" your_file_here

