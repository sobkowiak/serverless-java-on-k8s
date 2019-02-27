#!/bin/bash

oc login -u developer  https://master.example.com:8443 --insecure-skip-tls-verify=true
oc project faas

AUTH_SECRET=$(oc get secret whisk.auth -o yaml | grep "system:" | awk '{print $2}' | base64 --decode)
WSK_ROUTE=$(oc get route/openwhisk --template="{{.spec.host}}")

wsk property set --auth $AUTH_SECRET --apihost $WSK_ROUTE

source <(wsk sdk install bashauto --stdout)
