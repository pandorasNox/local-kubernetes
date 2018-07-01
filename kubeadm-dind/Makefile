
include ./etc/help.mk
# include ./etc/cli.mk

UID:=$(shell id -u)
PWD:=$(shell pwd)
KUBECTL ?= ~/.kubeadm-dind-cluster/kubectl

.PHONY: install
install: ##@setup downlaods and changes rights to kubeadm-dind-cluster setup shell file
	mkdir -p .install
	curl https://raw.githubusercontent.com/kubernetes-sigs/kubeadm-dind-cluster/1991cf6fd26e1c13879ec92dcbd80fb6d2f02423/fixed/dind-cluster-v1.10.sh > .install/dind-cluster-v1.10.sh
	chmod +x .install/dind-cluster-v1.10.sh

.PHONY: provision
provision: ##@setup spins up a X node kubernetes cluster in Y
	./.install/dind-cluster-v1.10.sh up
	$(KUBECTL) config use-context dind
	# $(MAKE) pod-network # maybe not necessary bec it useses docker bridge network

.PHONY: pod-network
pod-network:
	$(KUBECTL) apply -f https://cloud.weave.works/k8s/net?k8s-version=$(shell KUBECTL version | base64 | tr -d '\n')

.PHONY: prep-kubectl
prep-kubectl: ##@setup gets and adapts the kube config for kubectl
	# ./etc/copy_kube_conf.sh

.PHONY: setup
setup: ##@setup provisions the X kubernetes node and prepares local env
	$(MAKE) provision
	./.install/dind-cluster-v1.10.sh up
	# $(MAKE) prep-kubectl
	# $(MAKE) ku -- apply -f kubernetes/persistentVolume

.PHONY: start
start: ##@setup stops/paused the X node kubernetes cluster
	./.install/dind-cluster-v1.10.sh up

.PHONY: stop
stop: ##@setup stops/paused the X node kubernetes cluster
	./.install/dind-cluster-v1.10.sh down

.PHONY: destroy
destroy: ##@setup destroys the X node Y kubernetes cluster
	$(MAKE) stop
	./.install/dind-cluster-v1.10.sh clean

.PHONY: sys-req-check
sys-req-check: ##@setup checks system for required dependencies
	./etc/system-requirements-check.sh

.PHONY: status
status: ##@info get cluster status
	echo "todo"

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
