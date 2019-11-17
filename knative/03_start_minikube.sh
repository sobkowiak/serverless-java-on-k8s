#!/bin/bash

minikube config set profile knative
#minikube config set vm-driver virtualbox
#minikube config set cpus 5
#minikube config set memory 10240
#minikube config set disk-size 50g
#minikube config set kubernetes-version $KUBERNETES_VERSION

minikube start -p knative --memory=10240 --cpus=5 \
  --kubernetes-version=$KUBERNETES_VERSION \
  --vm-driver=virtualbox \
  --disk-size=50g \
  --extra-config=apiserver.enable-admission-plugins="LimitRanger,NamespaceExists,NamespaceLifecycle,ResourceQuota,ServiceAccount,DefaultStorageClass,MutatingAdmissionWebhook"

minikube -p knative addons enable registry
minikube -p knative addons enable dashboard

minikube profile knative
minikube kubectl > /dev/null 2>&1;
