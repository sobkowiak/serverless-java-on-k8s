#!/bin/bash


# docker images | awk '{print $1,$2}' | sed -e 's/ /:/' | sed -e 's/\(.*\)/docker pull \1/'

# pull docker images to be easier to install the other components in case of low bandwidth

eval $(minikube docker-env)

docker pull busybox:latest
docker pull zookeeper:3.4
docker pull redis:4.0
docker pull apache/couchdb:2.3
docker pull openwhisk/ow-utils:b05b7ff
docker pull openwhisk/invoker:b05b7ff
docker pull openwhisk/controller:b05b7ff
docker pull openwhisk/apigateway:0.11.0
docker pull gcr.io/kubernetes-helm/tiller:v2.14.3
docker pull openwhisk/action-nodejs-v10:1.14.0-incubating
docker pull openwhisk/python3action:1.13.0-incubating
docker pull openwhisk/java8action:1.13.0-incubating
docker pull nginx:1.15
docker pull openwhisk/kafkaprovider:2.0.0-incubating
docker pull openwhisk/cloudantprovider:2.0.0-incubating
docker pull openwhisk/alarmprovider:2.0.0-incubating
docker pull nheidloff/echo-java-quarkus:1
docker pull nheidloff/echo-nodejs-alpine:1
docker pull k8s.gcr.io/kube-addon-manager:v9.0
docker pull k8s.gcr.io/kubernetes-dashboard-amd64:v1.10.1
docker pull k8s.gcr.io/kube-proxy:v1.13.0
docker pull k8s.gcr.io/kube-controller-manager:v1.13.0
docker pull k8s.gcr.io/kube-scheduler:v1.13.0
docker pull k8s.gcr.io/kube-apiserver:v1.13.0
docker pull k8s.gcr.io/coredns:1.2.6
docker pull k8s.gcr.io/etcd:3.2.24
docker pull k8s.gcr.io/k8s-dns-dnsmasq-nanny-amd64:1.14.8
docker pull k8s.gcr.io/k8s-dns-sidecar-amd64:1.14.8
docker pull k8s.gcr.io/k8s-dns-kube-dns-amd64:1.14.8
docker pull k8s.gcr.io/pause:3.1
docker pull gcr.io/k8s-minikube/storage-provisioner:v1.8.1
docker pull wurstmeister/kafka:0.11.0.1
docker pull registry.hub.docker.com/library/registry:2.6.1
docker pull gcr.io/google_containers/kube-registry-proxy:0.4

