#!/bin/bash

wsk -i api create /webaction /hello POST webaction/hello-web

wsk -i api list /webaction | tail -n1 | awk '{print $4}'
API_URL=`wsk -i api list /webaction | tail -n1 | awk '{print $4}'`
echo $API_URL

curl -k -X POST -H 'Content-Type: application/json' $API_URL?text=4developers
curl -k -X POST -H 'Content-Type: application/json' $API_URL -d '{"text" : "4developers" }'

wsk -i api create /webaction /hello POST webaction/hello-web --response-type=http

curl -k -X POST -H 'Content-Type: application/json' $API_URL?text=4developers
curl -k -X POST -H 'Content-Type: application/json' $API_URL -d '{"text" : "4developers" }'
