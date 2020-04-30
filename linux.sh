#!/usr/bin/env bash
# All the stuff I needed to install on Linux

apt-get install zsh gcc


# Go dep
curl https://raw.githubusercontent.com/golang/dep/master/install.sh | sh


go get github.com/kubernetes-sigs/kustomize

# skaffold
curl -Lo skaffold https://storage.googleapis.com/skaffold/releases/v0.13.0/skaffold-linux-amd64 && chmod +x skaffold && sudo mv skaffold /usr/local/bin


sudo snap install --classic kubectl go
sudo snap install docker


packages="zsh"

# linux brew
 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"


brew install skaffold kustomize
brew install derailed/k9s/k9s


# https://ohmyz.sh/#install
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

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


# Append
# export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"
# export PATH="${PATH}:/snap/bin"

kubectl krew install ctx ns tail



alias k=kubectl
export PATH="${PATH}:${HOME}/.krew/bin"
export PATH="${PATH}:/snap/bin"
eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)

 git config --global user.email "warren.strange@forgerock.com"

git config --global user.name "Warren Strange"


# I had to use a service account for docker push
gsutil iam ch serviceAccount:docker-build@forgeops-public.iam.gserviceaccount.com:objectAdmin gs://artifacts.forgeops-public.appspot.com/
