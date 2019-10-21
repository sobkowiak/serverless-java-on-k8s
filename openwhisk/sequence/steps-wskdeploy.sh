

mvn clean package -f sorter/pom.xml
mvn clean package -f splitter/pom.xml
mvn clean package -f uppercase/pom.xml
 
wskdeploy -m manifest_sequence.yml
wsk -i action list

wsk -i package get --summary /whisk.system/sequence
wsk -i action invoke sequence/splitUpperAndSort -p text "Java,Python,Swift,JavaScript,Ruby,C" -r

wskdeploy undeploy -m manifest_sequence.yml

# wsk -i action create splitAndSort --sequence /whisk.system/utils/split,/whisk.system/utils/sort
# wsk -i action invoke --result splitAndSort --param payload "Java,Python,Swift,JavaScript,Ruby,C" --param separator ',' -r
# wsk -i action delete splitAndSort


