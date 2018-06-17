
include ./etc/help.mk
include ./etc/cli.mk

UID:=$(shell id -u)
PWD:=$(shell pwd)

.PHONY: provision
provision: ##@setup spins up a single node kubernetes cluster in vagrant
	vagrant up monovagk8s
	./etc/copy_kube_conf.sh
	#./etc/etc_hosts.sh $(vagrant ssh -c "echo \$NODE_IP") local.movaku
.PHONY: update
update: ##@setup updates the vagrant box
	vagrant box update

.PHONY: prep-kubectl
prep-kubectl: ##@setup gets and adapts the kube config for kubectl
	./etc/copy_kube_conf.sh

.PHONY: destroy
destroy: ##@setup destroys the single node vagrant kubernetes cluster
	vagrant destroy monovagk8s
	rm -rf kubernetes/.kube

.PHONY: stop
stop: ##@setup stops/paused the monon kubernetes node
	vagrant halt monovagk8s

.PHONY: login
login: ##@util log's you into the vagrant node
	vagrant ssh monovagk8s
	# ssh -l vagrant 172.17.8.201 -i .vagrant/machines/monovagk8s/virtualbox/private_key

.PHONY: sys-req-check
sys-req-check: ##@setup checks system for required dependencies
	./etc/system-requirements-check.sh

.PHONY: status
status: ##@info get vagrant status
	vagrant global-status

# If the first argument is "run"...
ifeq (ku,$(firstword $(MAKECMDGOALS)))
  # use the rest as arguments for "run"
  KU_ARGS := $(wordlist 2,$(words $(MAKECMDGOALS)),$(MAKECMDGOALS))
  # ...and turn them into do-nothing targets
  $(eval $(KU_ARGS):;@:)
endif
.PHONY: ku
ku: ##@util kubectl wrap | usage `make ku -- get po --all-namespaces`
	kubectl --kubeconfig kubernetes/.kube/config $(KU_ARGS)

# copy stuff
# scp -P 2222 vagrant@127.0.0.1:/home/vagrant/devstack/local.conf .
# vagrant ssh -c "sudo cat /home/vagrant/devstack/local.conf" > local.conf
# scp -i .vagrant/machines/monovagk8s/virtualbox/private_key vagrant@172.17.8.201:./test .
# kubectl config set-cluster kubernetes --server=https://172.17.8.201:6443

# .PHONY: baz
# baz:
# 	echo => $(filter-out $@,$(MAKECMDGOALS))
