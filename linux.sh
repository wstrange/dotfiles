#!/usr/bin/env bash
# All the stuff I needed to install on Linux

apt-get install zsh gcc


# https://ohmyz.sh/#install
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

sudo snap install --classic kubectl go
sudo snap install docker


# linux brew
 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

brew install skaffold kustomize
brew install derailed/k9s/k9s

brew tap GoogleContainerTools/kpt https://github.com/GoogleContainerTools/kpt.git
brew install kpt



# Krew
# https://krew.sigs.k8s.io/docs/user-guide/setup/install/
(
  set -x; cd "$(mktemp -d)" &&
  curl -fsSLO "https://github.com/kubernetes-sigs/krew/releases/latest/download/krew.{tar.gz,yaml}" &&
  tar zxvf krew.tar.gz &&
  KREW=./krew-"$(uname | tr '[:upper:]' '[:lower:]')_amd64" &&
  "$KREW" install --manifest=krew.yaml --archive=krew.tar.gz &&
  "$KREW" update
)
kubectl krew install ctx ns tail


# Append
cat >>~/.zshrc <<EOF

alias k=kubectl

export PATH="${PATH}:${HOME}/.krew/bin"
export PATH="${PATH}:/snap/bin"
eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)
export EDITOR=vi
EOF

git config --global user.email "warren.strange@forgerock.com"
git config --global user.name "Warren Strange"


sudo snap remove google-cloud-sdk
# Install the cloud sdk
curl https://sdk.cloud.google.com | bash



# I had to use a service account for docker push
# This sets the permissons on the bucket
gsutil iam ch serviceAccount:docker-build@forgeops-public.iam.gserviceaccount.com:objectAdmin gs://artifacts.forgeops-public.appspot.com/
