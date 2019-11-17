#!/bin/bash
set -x

wsk -i action create msgaction msgaction.js

wsk -i action invoke msgaction -r -p body '{"text":"4developers"}'
sleep 3
wsk -i action invoke msgaction -r -p body '{"text":"4developers"}'
sleep 3

wsk -i action update msgaction msgaction.py

wsk -i action invoke msgaction -r -p body '{"text":"4developers"}'
sleep 3
wsk -i action invoke msgaction -r -p body '{"text":"4developers"}'
sleep 3

wsk -i action update msgaction target/hello-msgaction.jar --main org.sobkowiak.demos.openwhisk.FunctionApp

wsk -i action invoke msgaction -r -p body '{"text":"4developers"}'
sleep 3
wsk -i action invoke msgaction -r -p body '{"text":"4developers"}'
sleep 3

wsk -i activation list -l 6
wsk -i activation list -l 6
