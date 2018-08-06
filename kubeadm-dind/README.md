# kubeadm-dind-cluster

based on [kubeadm-dind-cluster](https://github.com/kubernetes-sigs/kubeadm-dind-cluster)

## cheat-sheet
- `KUBE_EDITOR="nano" kubectl edit clusterrole kube-scheduler`
- `KUBE_EDITOR="nano" kubectl edit clusterrole system:kube-scheduler`
- `KUBE_EDITOR="nano" kubectl edit pod annotation-second-scheduler`

## example
1. deploy examples/nginxapp
    - drain 2nd node `kubectl drain node kube-node-2`

#### ToDo
- how to add more nodes?
- how or should we open the other nodes via ports or just use there IP adresses?
    - get all the IP adresses via script
- add `make status`
- scheduler-examlpe
    - https://github.com/uruddarraju/kubernetes-rbac-policies/blob/master/roles/scheduler-role.yaml
