#!/bin/bash

source 00_setenv.sh

source <(kubectl completion bash)
source <(minikube completion bash)
source <(kamel completion bash)
source <(wsk sdk install bashauto --stdout)

export OW_API_HOST_NAME=$(minikube ip)
export OW_API_HOST_PORT=31001

export KUBE_IP=$(minikube -n openwhisk service owdev-nginx --url | head -n1 | awk '{print substr($0,10,14)}')
export WSK_PORT=$(kubectl -n openwhisk describe service owdev-nginx | awk ' /https-api/ && /NodePort/ {print substr($3,0,5)}')
export AUTH_SECRET=$(kubectl -n openwhisk get secret owdev-whisk.auth -o yaml | grep "system:" | awk '{print $2}' | base64 --decode)
wsk property set --auth $AUTH_SECRET --apihost https://$KUBE_IP:$WSK_PORT