
include ./etc/help.mk
# include ./etc/cli.mk

UID:=$(shell id -u)
PWD:=$(shell pwd)
KUBECTL ?= ~/.kubeadm-dind-cluster/kubectl

.PHONY: install
install: ##@setup downlaods and changes rights to kubeadm-dind-cluster setup shell file
	mkdir -p .install
	# curl https://raw.githubusercontent.com/kubernetes-sigs/kubeadm-dind-cluster/1991cf6fd26e1c13879ec92dcbd80fb6d2f02423/fixed/dind-cluster-v1.10.sh > .install/dind-cluster-v1.10.sh
	# chmod +x .install/dind-cluster-v1.10.sh
	git clone https://github.com/kubernetes-sigs/kubeadm-dind-cluster.git .install
	chmod +x .install/dind-cluster.sh

# .PHONY: provision
# provision: ##@setup spins up a X node kubernetes cluster in Y
# 	$(KUBECTL) config use-context dind
# 	# $(MAKE) pod-network # maybe not necessary bec it useses docker bridge network

.PHONY: ctx
context: ##@setup gets and adapts the kube config for kubectl
	$(KUBECTL) config use-context dind

.PHONY: setup
setup: ##@setup provisions the X kubernetes node and prepares local env
	./.install/dind-cluster.sh up
	# $(MAKE) context
	# $(MAKE) ku -- apply -f kubernetes/persistentVolume

.PHONY: addons
addons: ##@setup deploy addons to kubeadm-dind-cluster
	$(MAKE) addon-rook-ceph

.PHONY: addon-rook-ceph
addon-rook-ceph: ##@setup deploy addons to kubeadm-dind-cluster
	kubectl --context=dind apply -f ./addons/rook/ceph/operator.yaml
	kubectl --context=dind apply -f ./addons/rook/ceph/cluster.yaml

.PHONY: start
start: ##@setup stops/paused the X node kubernetes cluster
	./.install/dind-cluster.sh up

.PHONY: stop
stop: ##@setup stops/paused the X node kubernetes cluster
	./.install/dind-cluster.sh down

.PHONY: destroy
destroy: ##@setup destroys the X node Y kubernetes cluster
	$(MAKE) stop
	./.install/dind-cluster.sh clean

.PHONY: sys-req-check
sys-req-check: ##@setup checks system for required dependencies
	./etc/system-requirements-check.sh

.PHONY: status
status: ##@info get cluster status
	kubectl --context=dind get nodes

# If the first argument is "run"...
ifeq (ku,$(firstword $(MAKECMDGOALS)))
  # use the rest as arguments for "run"
  KU_ARGS := $(wordlist 2,$(words $(MAKECMDGOALS)),$(MAKECMDGOALS))
  # ...and turn them into do-nothing targets
  $(eval $(KU_ARGS):;@:)
endif
.PHONY: ku
ku: ##@util kubectl wrap | usage `make ku -- get po --all-namespaces`
	# kubectl $(KU_ARGS)
	# kubectl --kubeconfig kubernetes/.kube/config $(KU_ARGS)
	~/.kubeadm-dind-cluster/kubectl config use-context dind
	~/.kubeadm-dind-cluster/kubectl $(KU_ARGS)
