# kube-client

[![Docker Cloud build status](https://img.shields.io/docker/cloud/build/genzouw/kube-client?style=for-the-badge)](https://hub.docker.com/r/genzouw/kube-client/)
[![Docker Pulls](https://img.shields.io/docker/pulls/genzouw/kube-client.svg?style=for-the-badge)](https://hub.docker.com/r/genzouw/kube-client/)
[![Docker Cloud Automated build](https://img.shields.io/docker/cloud/automated/genzouw/kube-client.svg?style=for-the-badge)](https://hub.docker.com/r/genzouw/kube-client/)


[![dockeri.co](https://dockeri.co/image/genzouw/kube-client)](https://hub.docker.com/r/genzouw/kube-client)

## Description

This is an all-in-one kubenetes client container image.

## Requirements

* [Docker](https://www.docker.com/)

## Installation

No need for anything.

## Configuration

If you are using Moji GCP, you need to authenticate.

```bash
# GCP Auth
$ docker run -ti --rm \
  --volume $HOME/.config/gcloud:/root/.config/gcloud \
  genzouw/kube-client \
  gcloud auth login

# GCR Auth
$ docker run -ti --rm \
  --volume $HOME/.config/gcloud:/root/.config/gcloud \
  genzouw/kube-client \
  gcloud auth configure-docker --quiet

# Load Kubernetes and GCP authorization files and launch container
$ docker run -ti --rm \
  --volume $HOME/.config/gcloud:/root/.config/gcloud \
  --volume $HOME/.kube:/root/.kube \
  genzouw/kube-client \
  bash
```

## Usage

```bash
# `kubens` command.
docker run -ti --rm \
  --volume $HOME/.config/gcloud:/root/.config/gcloud \
  --volume $HOME/.kube:/root/.kube \
  genzouw/kube-client \
  kubens

# `kubectx` command.
docker run -ti --rm \
  --volume $HOME/.config/gcloud:/root/.config/gcloud \
  --volume $HOME/.kube:/root/.kube \
  genzouw/kube-client \
  kubectx

# `kubectl` command.
docker run -ti --rm \
  --volume $HOME/.config/gcloud:/root/.config/gcloud \
  --volume $HOME/.kube:/root/.kube \
  genzouw/kube-client \
  kubectl get all

# `gcloud` command.
docker run -ti --rm \
  --volume $HOME/.config/gcloud:/root/.config/gcloud \
  --volume $HOME/.kube:/root/.kube \
  genzouw/kube-client \
  gcloud version
```

## License

This software is released under the MIT License, see LICENSE.


## Contribution


## Author Information

[genzouw](https://genzouw.com)

* Twitter   : @genzouw ( https://twitter.com/genzouw )
* Facebook  : genzouw ( https://www.facebook.com/genzouw )
* LinkedIn  : genzouw ( https://www.linkedin.com/in/genzouw/ )
* Gmail     : genzouw@gmail.com
