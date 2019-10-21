#!/bin/bash

wsk -i package create webaction
wsk -i action create webaction/hello-web target/hello-webaction.jar --main org.sobkowiak.demos.openwhisk.FunctionApp --web true

wsk -i action get --url webaction/hello-web 
wsk -i action get --url webaction/hello-web | awk 'FNR==2{print $1""}'
WEB_URL=`wsk -i action get --url webaction/hello-web | awk 'FNR==2{print $1""}'`
echo $WEB_URL 
AUTH=`oc get secret whisk.auth -n faas -o yaml | grep "system:" | awk '{print $2}'` # # (2)

curl -k $WEB_URL?text=TechTalk
curl -k $WEB_URL.http?text=TechTalk
curl -k $WEB_URL.json?text=TechTalk
curl -k  -H 'Content-Type: application/json' -X POST $WEB_URL.http -d '{"text" : "4developers" }'
curl -k  -H 'Content-Type: application/json' -X POST $WEB_URL.json -d '{"text" : "4developers" }'

wsk -i action update webaction/hello-web --web false
curl -k $WEB_URL?text=TechTalk

wsk -i action delete webaction/hello-web
wsk -i package delete webaction


wskdeploy -m manifest_java-webaction.yml 
curl -k $WEB_URL?text=TechTalk
curl -k  $WEB_URL -d '{"text" : "TechTalk" }' -H 'Content-Type: application/json'
wskdeploy undeploy -m manifest_java-webaction.yml 

