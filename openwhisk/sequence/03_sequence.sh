#!/bin/bash
set -x

mvn clean package -f sorter/pom.xml
mvn clean package -f splitter/pom.xml
mvn clean package -f uppercase/pom.xml
 
wskdeploy -m manifest_sequence.yml
wsk -i action list

wsk -i action invoke sequence/splitUpperAndSort -p text "Java,Python,Swift,JavaScript,Ruby,C" -r

# wskdeploy undeploy -m manifest_sequence.yml

