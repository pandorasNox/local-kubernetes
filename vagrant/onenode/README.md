
## TODO
- persistentVolume
- add docker registry
- make provision vs make setup
    - write etc host file with IP and std hostname
- add ingress
- add workflow / examples (build local cont => push via reg, share docker env )

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
