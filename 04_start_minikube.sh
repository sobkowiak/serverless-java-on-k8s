#!/bin/bash

minikube config set profile 4developers
#minikube config set vm-driver virtualbox
#minikube config set cpus 5
#minikube config set memory 10240
#minikube config set disk-size 50g
#minikube config set kubernetes-version $KUBERNETES_VERSION
minikube config set WantUpdateNotification false

minikube start -p 4developers --memory=10240 --cpus=5 \
  --kubernetes-version=$KUBERNETES_VERSION \
  --vm-driver=virtualbox \
  --disk-size=50g \
  --extra-config=apiserver.enable-admission-plugins="LimitRanger,NamespaceExists,NamespaceLifecycle,ResourceQuota,ServiceAccount,DefaultStorageClass,MutatingAdmissionWebhook"

minikube -p 4developers addons enable registry
minikube -p 4developers addons enable dashboard

minikube profile 4developers
minikube kubectl > /dev/null 2>&1;
