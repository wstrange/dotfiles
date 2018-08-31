#!/usr/bin/env bash
# All the stuff I needed to install on Linux

apt-get install golang


# Go dep
curl https://raw.githubusercontent.com/golang/dep/master/install.sh | sh


go get github.com/kubernetes-sigs/kustomize

# skaffold
curl -Lo skaffold https://storage.googleapis.com/skaffold/releases/v0.13.0/skaffold-linux-amd64 && chmod +x skaffold && sudo mv skaffold /usr/local/bin
