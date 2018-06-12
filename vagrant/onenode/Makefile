HELP_FUN = \
	%help; \
	while(<>) { push @{$$help{$$2 // 'options'}}, [$$1, $$3] if /^([a-zA-Z\-]+)\s*:.*\#\#(?:@([a-zA-Z\-]+))?\s(.*)$$/ }; \
	print "usage: make [target]\n\n"; \
	for (sort keys %help) { \
	print "${WHITE}$$_:${RESET}\n"; \
	for (@{$$help{$$_}}) { \
	$$sep = " " x (32 - length $$_->[0]); \
	print "  ${YELLOW}$$_->[0]${RESET}$$sep${GREEN}$$_->[1]${RESET}\n"; \
	}; \
	print "\n"; }

UID:=$(shell id -u)
PWD:=$(shell pwd)

.PHONY: help
help: ##@other Show this help.
	@perl -e '$(HELP_FUN)' $(MAKEFILE_LIST)

.PHONY: provision
provision: ##@setup spins up a single node kubernetes cluster in vagrant
	vagrant up monovagk8s
	./etc/copy_kube_conf.sh
	#./etc/etc_hosts.sh $(vagrant ssh -c "echo \$NODE_IP") local.movaku

.PHONY: destroy
destroy: ##@setup if exists, it stops and delets the single node kubernetes instance
	vagrant destroy monovagk8s
	rm -rf kubernetes/.kube

.PHONY: stop
stop: ##@setup stops/paused the monon kubernetes node
	vagrant halt monovagk8s

.PHONY: login
login:
	vagrant ssh monovagk8s
	# ssh -l vagrant 172.17.8.201 -i .vagrant/machines/monovagk8s/virtualbox/private_key

.PHONY: system-requirements-check
system-requirements-check: ##@setup checks system for required dependencies
	./etc/system-requirements-check.sh


# copy stuff
# scp -P 2222 vagrant@127.0.0.1:/home/vagrant/devstack/local.conf .
# vagrant ssh -c "sudo cat /home/vagrant/devstack/local.conf" > local.conf
# scp -i .vagrant/machines/monovagk8s/virtualbox/private_key vagrant@172.17.8.201:./test .
