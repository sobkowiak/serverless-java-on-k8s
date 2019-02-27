#!/bin/bash

wsk -i action update msgaction target/hello-msgaction.jar --main com.example.FunctionApp
wsk -i action invoke msgaction -r -p body '{"text":"Tech Talk SE"}'

wskdeploy -m manifest_java-msgaction.yml
wsk -i action invoke /whisk.system/hello/msgaction -r -p body '{"text":"Tech Talk SE"}'
wsk -i action invoke hello/msgaction -r -p body '{"text":"Tech Talk SE"}'
wskdeploy undeploy -m manifest_java-msgaction.yml


