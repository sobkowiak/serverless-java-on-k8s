#!/bin/bash

minikube config set profile knatiwe
#minikube config set vm-driver virtualbox
#minikube config set cpus 5
#minikube config set memory 10240
#minikube config set disk-size 50g
#minikube config set kubernetes-version $KUBERNETES_VERSION

minikube start -p knatiwe --memory=10240 --cpus=5 \
  --kubernetes-version=$KUBERNETES_VERSION \
  --vm-driver=virtualbox \
  --disk-size=50g \
  --extra-config=apiserver.enable-admission-plugins="LimitRanger,NamespaceExists,NamespaceLifecycle,ResourceQuota,ServiceAccount,DefaultStorageClass,MutatingAdmissionWebhook"

minikube -p knatiwe addons enable registry
minikube -p knatiwe addons enable dashboard

minikube profile knatiwe
minikube kubectl > /dev/null 2>&1;
