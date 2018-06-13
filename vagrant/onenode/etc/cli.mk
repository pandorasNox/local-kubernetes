# inspired by https://gitlab.com/utopia-planitia/kubernetes/blob/0bb42d09eb5201bc099a8be5b5dbf697ef75f6a3/etc/cli.mk

KUBERNETES_TOOLS_IMAGE ?= $(shell docker build -q ./docker/dev-tools)

# KUBERNETES_REALPATH ?= $(shell realpath ./kubernetes/)

# KUBERNETES_CERTIFICATES ?= $(shell realpath ../kubernetes/certificates)
# KUBERNETES_ETC ?= $(shell realpath ../kubernetes/etc)
# KUBECONFIG ?= /kubernetes/certificates/master/admin-kube-config
KUBECONFIG ?= /workspace/kubernetes/.kube/config
DOCKER ?= docker
DOCKER_OPTIONS += -v $(PWD):/workspace -w /workspace
# DOCKER_OPTIONS += $(shell [ ! -z "$(SSH_AUTH_SOCK)" ] && echo -v $(SSH_AUTH_SOCK):$(SSH_AUTH_SOCK) -e SSH_AUTH_SOCK=$(SSH_AUTH_SOCK))
# DOCKER_OPTIONS += -v ~/.ssh/ovh:/root/.ssh/ovh
# DOCKER_OPTIONS += -v ~/.ssh/digital-ocean:/root/.ssh/digital-ocean
# DOCKER_OPTIONS += -v ~/.vagrant.d/:/root/.vagrant.d/
# DOCKER_OPTIONS += -v $(KUBERNETES_CERTIFICATES):/kubernetes/certificates
# DOCKER_OPTIONS += -v ~/.vagrant.d/:/root/.vagrant.d/
DOCKER_OPTIONS += -e KUBECONFIG=$(KUBECONFIG)
# DOCKER_OPTIONS += -v $(KUBERNETES_ETC):/kubernetes/etc

CLI = $(DOCKER) run --network host --rm -it $(DOCKER_OPTIONS) $(KUBERNETES_TOOLS_IMAGE)

.PHONY: cli
cli: ##@development creates admin command line interface
	$(CLI) bash
