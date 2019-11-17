#!/bin/bash


# docker images | awk '{print $1,$2}' | sed -e 's/ /:/' | sed -e 's/\(.*\)/docker pull \1/'

# pull docker images to be easier to install the other components in case of low bandwidth

eval $(minikube docker-env)

docker pull burrsutter/booted:<none>
docker pull burrsutter/quarked:<none>
docker pull burrsutter/noded:<none>
docker pull openzipkin/zipkin:2.13.0
docker pull istio/proxyv2:1.1.7
docker pull istio/pilot:1.1.7
docker pull istio/node-agent-k8s:1.1.7
docker pull istio/kubectl:1.1.7
docker pull quay.io/rhdevelopers/prime-generator:<none>
docker pull quay.io/rhdevelopers/knative-tutorial-greeter:<none>
docker pull alpine:3.6
docker pull k8s.gcr.io/kube-addon-manager:v9.0
docker pull k8s.gcr.io/kubernetes-dashboard-amd64:v1.10.1
docker pull k8s.gcr.io/kube-proxy:v1.13.0
docker pull k8s.gcr.io/kube-controller-manager:v1.13.0
docker pull k8s.gcr.io/kube-scheduler:v1.13.0
docker pull k8s.gcr.io/kube-apiserver:v1.13.0
docker pull k8s.gcr.io/coredns:1.2.6
docker pull k8s.gcr.io/etcd:3.2.24
docker pull quay.io/coreos/kube-rbac-proxy:v0.3.0
docker pull quay.io/coreos/kube-state-metrics:v1.3.0
docker pull quay.io/coreos/monitoring-grafana:5.0.3
docker pull prom/prometheus:v2.2.1
docker pull k8s.gcr.io/fluentd-elasticsearch:v2.0.4
docker pull k8s.gcr.io/k8s-dns-dnsmasq-nanny-amd64:1.14.8
docker pull k8s.gcr.io/k8s-dns-sidecar-amd64:1.14.8
docker pull k8s.gcr.io/k8s-dns-kube-dns-amd64:1.14.8
docker pull k8s.gcr.io/pause:3.1
docker pull quay.io/prometheus/node-exporter:v0.15.2
docker pull k8s.gcr.io/elasticsearch:v5.6.4
docker pull gcr.io/k8s-minikube/storage-provisioner:v1.8.1
docker pull docker.elastic.co/kibana/kibana:5.6.4
docker pull registry.hub.docker.com/library/registry:2.6.1
docker pull k8s.gcr.io/addon-resizer:1.7
docker pull gcr.io/google_containers/kube-registry-proxy:0.4

