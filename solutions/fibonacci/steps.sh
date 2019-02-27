#!/bin/bash

wskdeploy -m manifest_fibonacci.yml 

WEB_URL=`wsk -i action get --url fibonacci/fibonacci | awk 'FNR==2{print $1".json"}'`
echo $WEB_URL 

wsk -i action invoke fibonacci/fibonacci -p num 5
curl -k $WEB_URL?num=5

wskdeploy undeploy -m manifest_fibonacci.yml 

