
## TODO
- handle certs (done via kubeadm ?!)
    - create them via ansible and put them on the node
    - OR creat them during node cretion and pull them from the node
    - needed for the docker container in `make cli`
- cp ssh + kubernetes certificates from vagrant to host
    - via vagrant
    - via ssh ???
    - where?
- make provision vs make setup
    - write etc host file with IP and std hostname
- add ingress
- add docker registry

#### resources
- https://medium.com/@lizrice/kubernetes-in-vagrant-with-kubeadm-21979ded6c63
- https://gist.github.com/lizrice/69d3b28979391287176b3b7155a327b9
- https://gitlab.com/utopia-planitia/kubernetes
- https://github.com/pandorasNox/docker-hands-on-guide/blob/master/k8s-cluster-vagrant/Vagrantfile
