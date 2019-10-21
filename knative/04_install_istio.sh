#!/bin/bash

kubectl apply --filename  https://raw.githubusercontent.com/knative/serving/v0.7.1/third_party/istio-1.1.7/istio-crds.yaml && \
kubectl apply --filename  https://raw.githubusercontent.com/knative/serving/v0.7.1/third_party/istio-1.1.7/istio-lean.yaml