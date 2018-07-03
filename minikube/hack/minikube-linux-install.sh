#!/bin/sh

date
echo 
echo check minikube binary ...
if [ -f /usr/local/bin/minikube ]; then
    echo minikube existing, change to minikube.old
    sudo mv /usr/local/bin/minikube /usr/local/bin/minikube.old
fi

if [ -f /usr/local/bin/localkube ]; then
    echo localkube existing, change to localkube.old
    sudo mv /usr/local/bin/localkube /usr/local/bin/localkube.old
fi

echo Install minikube ...
curl -Lo minikube https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64 \
&& chmod +x minikube && sudo mv minikube /usr/local/bin

if [ -d $HOME/.minikube ]; then
    sudo rm -r $HOME/.minikube
fi

echo 
echo minikube start ...
minikube start --vm-driver=virtualbox

sudo chmod +x /usr/local/bin/localkube

echo 
date
echo minikube installation done 
