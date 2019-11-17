#!/bin/bash

#git clone https://github.com/rabbah/wsk-qr.git
cd wsk-qr


gradle jar
wsk -i package create qr
wsk -i action create qr/generate build/libs/wsk-qr-1.0.jar --main qr.Generate --web true
wsk -i action create qr/ui src/main/js/qr/ui.js --web true

wsk -i action get qr/ui --url | tail -1 | awk '{print $1".html"}'
wsk -i action get qr/generate --url | tail -1 | awk '{print $1".http"}'
WEB_URL=`wsk -i action get qr/generate --url | tail -1 | awk '{print $1".http"}'`

curl -k $WEB_URL?text=Hello --output output.png

