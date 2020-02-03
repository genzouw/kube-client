FROM ubuntu:18.04

LABEL maintainer "genzouw <genzouw@gmail.com>"

RUN apt-get update \
  && apt-get upgrade -y \
  && apt-get -y install \
    curl \
    git \
    gnupg \
    gnupg2 \
    vim \
  && apt-get clean \
  && rm -rf /var/cache/apt/archives/* /var/lib/apt/lists/*

RUN curl -fsSL https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3 | bash - \
  && helm repo add stable https://kubernetes-charts.storage.googleapis.com/

RUN curl -fsSL https://packages.cloud.google.com/apt/doc/apt-key.gpg \
  | apt-key add - \
  && echo "deb http://apt.kubernetes.io/ kubernetes-xenial main" \
  | tee /etc/apt/sources.list.d/kube.list

RUN curl https://packages.cloud.google.com/apt/doc/apt-key.gpg \
  | apt-key --keyring /usr/share/keyrings/cloud.google.gpg add - \
  && echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] http://packages.cloud.google.com/apt cloud-sdk main" \ 
  | tee -a /etc/apt/sources.list.d/google-cloud-sdk.list

RUN apt-get update \
  && apt-get -y install \
    kubectl \
    google-cloud-sdk \
  && apt-get clean \
  && rm -rf /var/cache/apt/archives/* /var/lib/apt/lists/*

RUN git clone https://github.com/ahmetb/kubectx /opt/kubectx \
  && ln -s /opt/kubectx/kubectx /usr/local/bin/kubectx \
  && ln -s /opt/kubectx/kubens /usr/local/bin/kubens \

