#!/bin/bash

wsk -i package create webaction
wsk -i action create webaction/hello-web target/hello-webaction.jar --main com.example.FunctionApp --web true

wsk -i action get --url webaction/hello-web 
wsk -i action get --url webaction/hello-web | awk 'FNR==2{print $1".json"}'
WEB_URL=`wsk -i action get --url webaction/hello-web | awk 'FNR==2{print $1".json"}'`
echo $WEB_URL 
AUTH=`oc get secret whisk.auth -n faas -o yaml | grep "system:" | awk '{print $2}'` # # (2)

curl -k https://openwhisk-faas.apps-2700.generic.opentlc.com/api/v1/web/whisk.system/webaction/hello-web.json?text=TechTalk
curl -k https://openwhisk-faas.apps-2700.generic.opentlc.com/api/v1/web/whisk.system/webaction/hello-web?text=TechTalk
curl -k https://openwhisk-faas.apps-2700.generic.opentlc.com/api/v1/web/whisk.system/webaction/hello-web.http?text=TechTalk
curl -k https://openwhisk-faas.apps-2700.generic.opentlc.com/api/v1/web/whisk.system/webaction/hello-web.json -d '{"text" : "TechTalk" }' -H 'Content-Type: application/json'

curl -k $WEB_URL?text=TechTalk
curl -k  $WEB_URLh-d '{"text" : "TechTalk" }' -H 'Content-Type: application/json'

wsk -i action update webaction/hello-web --web false
curl -k $WEB_URL?text=TechTalk

wsk -i action delete webaction/hello-web
wsk -i package delete webactipn


wskdeploy -m manifest_java-webaction.yml 
curl -k $WEB_URL?text=TechTalk
curl -k  $WEB_URL -d '{"text" : "TechTalk" }' -H 'Content-Type: application/json'
wskdeploy undeploy -m manifest_java-webaction.yml 

