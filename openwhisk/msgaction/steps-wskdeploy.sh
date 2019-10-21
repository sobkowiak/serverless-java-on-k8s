#!/bin/bash

wskdeploy -m manifest_java-msgaction.yml
wsk -i action invoke /whisk.system/hello/msgaction -r -p body '{"text":"4developers"}'
wsk -i action invoke hello/msgaction -r -p body '{"text":"4developers"}'
wskdeploy undeploy -m manifest_java-msgaction.yml


