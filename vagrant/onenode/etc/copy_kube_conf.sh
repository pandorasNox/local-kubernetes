#!/bin/sh

mkdir kubernetes || true
mkdir kubernetes/.kube || true
scp -i .vagrant/machines/monovagk8s/virtualbox/private_key -o StrictHostKeyChecking=no vagrant@172.17.8.201:/home/vagrant/.kube/config kubernetes/.kube/config
kubectl --kubeconfig kubernetes/.kube/config config set-cluster kubernetes --server=https://172.17.8.201:6443
