#!/bin/bash

export WKS_HOME=/home/ksobkowiak/work/4developers
export TOOLS_HOME=$WKS_HOME/soft-kn
export GRAALVM_HOME=$TOOLS_HOME/graalvm
export PATH=$GRAALVM_HOME/bin:$TOOLS_HOME/bin:$PATH


export MINIKUBE_VERSION=1.3.1
export KUBERNETES_VERSION=v1.13.0
export MINIKUBE_HOME=$TOOLS_HOME/minikube_$MINIKUBE_VERSION;
export PATH=$MINIKUBE_HOME/.minikube/cache/$KUBERNETES_VERSION:$PATH
export KUBECONFIG=$MINIKUBE_HOME/.kube/config
#export KUBE_EDITOR="vim"

export HELM_HOME=$MINIKUBE_HOME/.helm