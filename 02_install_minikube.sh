#!/bin/bash

source 00_setenv.sh

if [ ! -f $MINIKUBE_HOME/.kube ]; then
  mkdir -p $MINIKUBE_HOME/.kube;
fi

# install kubectl
# https://kubernetes.io/docs/tasks/tools/install-kubectl/

#if [ ! -f /etc/yum.repos.d/kubernetes.repo ]; then
#sudo cat <<EOF > /etc/yum.repos.d/kubernetes.repo
#[kubernetes]
#name=Kubernetes
#baseurl=https://packages.cloud.google.com/yum/repos/kubernetes-el7-x86_64
#enabled=1
#gpgcheck=1
#repo_gpgcheck=1
#gpgkey=https://packages.cloud.google.com/yum/doc/yum-key.gpg https://packages.cloud.google.com/yum/doc/rpm-package-key.gpg
#EOF
#fi

#kubectl version > /dev/null 2>&1;
#if [  $? -ne 1 ]; then
#  echo "installing kubectl...";
#  sudo dnf install -y kubectl
#fi

kubectl version | grep $KUBERNETES_VERSION > /dev/null 2>&1;
if [ $? -ne 0 ]; then
    curl -L https://storage.googleapis.com/kubernetes-release/release/$KUBERNETES_VERSION/bin/linux/amd64/kubectl \
      -o $TOOLS_HOME/bin/kubectl \
      && chmod u+x $TOOLS_HOME/bin/kubectl
fi

source <(kubectl completion bash)

# install minikube
# https://minikube.sigs.k8s.io/docs/start/linux/
# https://kubernetes.io/docs/tasks/tools/install-minikube/

minikube version | grep $MINIKUBE_VERSION > /dev/null 2>&1;
if [ $? -ne 0 ]; then
  curl -L https://storage.googleapis.com/minikube/releases/v$MINIKUBE_VERSION/minikube-linux-amd64 \
    -o $TOOLS_HOME/bin/minikube \
    && chmod u+x $TOOLS_HOME/bin/minikube
fi
source <(minikube completion bash)


# install kubectx
# https://github.com/ahmetb/kubectx

if [ ! -f $TOOLS_HOME/bin/kubens  ]; then
    curl -L https://raw.githubusercontent.com/ahmetb/kubectx/master/kubens -o $TOOLS_HOME/bin/kubens \
      && chmod u+x $TOOLS_HOME/bin/kubens
fi

if [ ! -f $TOOLS_HOME/bin/kubectx  ]; then
    curl -L https://raw.githubusercontent.com/ahmetb/kubectx/master/kubectx -o $TOOLS_HOME/bin/kubectx
fi

