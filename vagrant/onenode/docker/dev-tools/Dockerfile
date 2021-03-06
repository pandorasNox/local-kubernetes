# source: https://gitlab.com/utopia-planitia/kubernetes/blob/0bb42d09eb5201bc099a8be5b5dbf697ef75f6a3/docker/dev-tools/Dockerfile

FROM ubuntu:18.04

# tools
RUN apt-get update && \
	apt-get install -y \
		software-properties-common \
		python-pip \
		git \
		curl \
		rsync \
		gettext-base \
		nano dnsutils \
		iputils-ping \
		openssh-client \
		make \
		bash-completion \
		apache2-utils \
		bats && \
	apt-get clean && \
  rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
CMD ["bash"]

# ansible
ENV ANSIBLE_VERSION 2.5.1
RUN pip install ansible==${ANSIBLE_VERSION}

# ansible lint
RUN pip install ansible-lint

# ansible digital ocean lib
RUN pip install dopy

# enable bash autocompletion
RUN echo . /etc/bash_completion >> /root/.bashrc

# cloudflare ssl tools
RUN curl -s -L -o /usr/local/bin/cfssl		https://pkg.cfssl.org/R1.2/cfssl_linux-amd64 && \
	chmod +x /usr/local/bin/cfssl && \
	curl -s -L -o /usr/local/bin/cfssljson	https://pkg.cfssl.org/R1.2/cfssljson_linux-amd64 && \
	chmod +x /usr/local/bin/cfssljson

# kubectl
ENV KUBERNETES_VERSION v1.10.1
RUN curl -s -L -o /usr/local/bin/kubectl https://storage.googleapis.com/kubernetes-release/release/${KUBERNETES_VERSION}/bin/linux/amd64/kubectl && \
	chmod +x /usr/local/bin/kubectl && \
	echo "source <(kubectl completion bash)" >> ~/.bashrc
