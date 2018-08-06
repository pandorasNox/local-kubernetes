
include ./hack/help.mk
# include ./hack/cli.mk

UID:=$(shell id -u)
PWD:=$(shell pwd)
KUBECTL ?= kubectl

# eval $(minikube docker-env)

.PHONY: install
install: ##@setup downlaods and changes rights to minikube setup shell file
	./hack/minikube-linux-install.sh

.PHONY: start
start: ##@dev (re)starts the minikube cluster
	minikube start

.PHONY: stop
stop: ##@dev stops the minikube cluster
	minikube stop

.PHONY: destroy
destroy: ##@dev deletes the minikube cluster
	minikube delete

.PHONY: status
status: ##@status displays the minikube status
	minikube status

.PHONY: addons
addons: ##@setup enables some default addons like ingress
	minikube addons enable freshpod
	minikube addons enable ingress

.PHONY: addon-local-persistent-volume
addon-local-persistent-volume: ##@setup provides a local PersistentVolume
	minikube ssh "mkdir -p /tmp/data/pv-1"
	$(KUBECTL) apply -f addons/local-storage.yaml

.PHONY: deploy
deploy: ##@setup deploy basic addons
	$(MAKE) addons
	$(MAKE) addon-local-persistent-volume

.PHONY: context
context: ##@setup gets and adapts the kube config for kubectl
	$(KUBECTL) config use-context minikube

# If the first argument is "do"...
ifeq (do,$(firstword $(MAKECMDGOALS)))
  # use the rest as arguments for "do"
  DO_ARGS := $(wordlist 2,$(words $(MAKECMDGOALS)),$(MAKECMDGOALS))
  # ...and turn them into do-nothing targets
  $(eval $(DO_ARGS):;@:)
endif
.PHONY: do
do: ##@setup reuse minikube docker env
	@eval $$(minikube docker-env) ;\
	docker $(DO_ARGS)
