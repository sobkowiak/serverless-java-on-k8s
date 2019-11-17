#!/bin/bash
set -x

wskdeploy -m manifest_java-webaction.yml

WEB_URL=`wsk -i action get --url webaction/hello-web | awk 'FNR==2{print $1""}'`
echo $WEB_URL 

curl -k  -H 'Content-Type: application/json' -X POST $WEB_URL.http -d '{"text" : "4developers" }'
curl -k  -H 'Content-Type: application/json' -X POST $WEB_URL.json -d '{"text" : "4developers" }'


# wskdeploy undeploy -m manifest_java-webaction.yml
