#!/usr/bin/env bash 

brew update
brew install argoproj/tap/argocd


cat <<EOF | xargs brew info
argocd
asciinema
autoconf
automake
bazel
cfssl
dart
dep
docker
docker-clean
docker-compose
docker-machine
fdupes
gdbm
gettext
gist
git
glib
gnu-sed
go
gradle
icu4c
istioctl
jemalloc
jq
jsonnet
kubectx
kubernetes-cli
kubernetes-helm
kustomize
libevent
libffi
libidn2
libtermkey
libtool
libunistring
libuv
libvterm
libyaml
luajit
maven
mercurial
EOF
