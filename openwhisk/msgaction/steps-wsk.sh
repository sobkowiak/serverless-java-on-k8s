#!/bin/bash

## JS

wsk -i action create msgaction msgaction.js

wsk -i action invoke msgaction -r -p body '{"text":"4developers"}'
wsk -i action invoke msgaction  -p body '{"text":"4developers"}'
wsk -i activation list -l 5
wsk -i activation result  $(wsk -i activation list -l 1 | tail -n1 | awk '{print $3}')

# while (true); do wsk -i action invoke msgaction -r -p body '{"text":"4developers"}'; done

## Python

wsk -i action update msgaction msgaction.py

wsk -i action invoke msgaction -r -p body '{"text":"4developers"}'

## Java

wsk -i action update msgaction target/hello-msgaction.jar --main org.sobkowiak.demos.openwhisk.FunctionApp

wsk -i action invoke msgaction -r -p body '{"text":"4developers"}'

# while (true); do wsk -i action invoke msgaction -r -p body '{"text":"4developers"}'; done

# wsk -i action delete msgaction
