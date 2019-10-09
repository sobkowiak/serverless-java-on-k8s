#!/bin/bash

kubectl apply --selector knative.dev/crd-install=true \
   --filename https://github.com/knative/serving/releases/download/v0.7.1/serving.yaml \
   --filename https://github.com/knative/eventing/releases/download/v0.7.1/release.yaml \
   --filename https://github.com/knative/serving/releases/download/v0.7.1/monitoring.yaml

kubectl apply --selector networking.knative.dev/certificate-provider!=cert-manager \
   --filename https://github.com/knative/serving/releases/download/v0.7.1/serving.yaml \
   --filename https://github.com/knative/eventing/releases/download/v0.7.1/release.yaml \
   --filename https://github.com/knative/serving/releases/download/v0.7.1/monitoring.yaml

kubectl label nodes --all beta.kubernetes.io/fluentd-ds-ready="true"