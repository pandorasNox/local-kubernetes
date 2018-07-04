
include ./hack/help.mk
# include ./hack/cli.mk

UID:=$(shell id -u)
PWD:=$(shell pwd)
KUBECTL ?= kubectl
MINIKUBE ?= minikube

# eval $(minikube docker-env)

.PHONY: mini-setup
mini-setup: ##@setup minikube kubectl context
	$(KUBECTL) config use-context minikube

.PHONY: mini-mount
mini-mount: ##@setup pwd as mount for minikube
	$(MINIKUBE) mount $(PWD):/kubeapp

.PHONY: mini-delpoy-base
mini-delpoy-base: ##@deploy delpoys kubeapp svc
	$(KUBECTL) apply -f $(PWD)/kubernetes/namespace.yaml
	$(KUBECTL) apply -f $(PWD)/kubernetes/service.yaml

.PHONY: mini-delpoy-mount
mini-delpoy-mount: ##@setup delpoy mount deployment for minikube
	$(MAKE) mini-delpoy-base
	$(KUBECTL) apply -f $(PWD)/kubernetes/flows/mount/

# If the first argument is "run"...
ifeq (mini-docker-build,$(firstword $(MAKECMDGOALS)))
  # use the rest as arguments for "run"
  DO_ARGS := $(wordlist 2,$(words $(MAKECMDGOALS)),$(MAKECMDGOALS))
  # ...and turn them into do-nothing targets
  $(eval $(DO_ARGS):;@:)
endif
.PHONY: mini-docker-build
mini-docker-build: ##@setup reuse minikube docker env
	@eval $$(minikube docker-env) ;\
	docker build -t kubeapp:$(DO_ARGS) .

.PHONY: mini-delpoy-docker-env
mini-delpoy-docker-env: ##@setup delpoy docker-env deployment for minikube
	$(MAKE) mini-delpoy-base
	$(KUBECTL) apply -f $(PWD)/kubernetes/flows/docker-env/
