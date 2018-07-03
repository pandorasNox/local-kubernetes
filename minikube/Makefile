
include ./hack/help.mk
# include ./hack/cli.mk

UID:=$(shell id -u)
PWD:=$(shell pwd)
KUBECTL ?= kubectl

# eval $(minikube docker-env)

.PHONY: install
install: ##@setup downlaods and changes rights to minikube setup shell file
	./hack/minikube-linux-install.sh

# If the first argument is "run"...
ifeq (do,$(firstword $(MAKECMDGOALS)))
  # use the rest as arguments for "run"
  DO_ARGS := $(wordlist 2,$(words $(MAKECMDGOALS)),$(MAKECMDGOALS))
  # ...and turn them into do-nothing targets
  $(eval $(DO_ARGS):;@:)
endif
.PHONY: do
do: ##@setup reuse minikube docker env
	@eval $$(minikube docker-env) ;\
	docker $(DO_ARGS)
