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
	#./etc/etc_hosts.sh $(vagrant ssh -c "echo \$NODE_IP") local.movaku

.PHONY: destroy
destroy: ##@setup if exists, it stops and delets the single node kubernetes instance
	vagrant destroy monovagk8s

.PHONY: stop
stop: ##@setup stops/paused the monon kubernetes node
	vagrant halt monovagk8s

.PHONY: login
login:
	vagrant ssh monovagk8s
