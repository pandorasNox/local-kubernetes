
## TODO
- persistentVolume (80% done)
- add ingress
- add docker registry
    - also write etc host file for docker-registry domain
- make provision vs make setup
    - write etc host file with IP and std hostname

## room for improvement
- handle certs (done via kubeadm ?!)
    - create them via ansible and put them on the node
    - OR creat them during node cretion and pull them from the node
    - needed for the docker container in `make cli`

#### resources
- https://medium.com/@lizrice/kubernetes-in-vagrant-with-kubeadm-21979ded6c63
- https://gist.github.com/lizrice/69d3b28979391287176b3b7155a327b9
- https://gitlab.com/utopia-planitia/kubernetes
- https://github.com/pandorasNox/docker-hands-on-guide/blob/master/k8s-cluster-vagrant/Vagrantfile
