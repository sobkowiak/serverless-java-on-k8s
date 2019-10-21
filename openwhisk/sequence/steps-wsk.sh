

mvn clean package -f sorter/pom.xml
mvn clean package -f splitter/pom.xml
mvn clean package -f uppercase/pom.xml
 
wsk -i package create sequence
wsk -i action create sequence/sorter sorter/target/sorter.jar --main org.sobkowiak.demos.openwhisk.FunctionApp
wsk -i action create sequence/splitter splitter/target/splitter.jar --main org.sobkowiak.demos.openwhisk.FunctionApp
wsk -i action create sequence/uppercase uppercase/target/uppercase.jar --main org.sobkowiak.demos.openwhisk.FunctionApp
wsk -i action update sequence/splitUpperAndSort --sequence sequence/splitter,sequence/uppercase,sequence/sorter
wsk -i action list
wsk -i package get --summary /whisk.system/sequence

wsk -i action invoke sequence/splitUpperAndSort -p text "Java,Python,Swift,JavaScript,Ruby,C" -r

wsk -i action delete sequence/splitUpperAndSort
wsk -i action delete sequence/splitter
wsk -i action delete sequence/uppercase
wsk -i action delete sequence/sorter
wsk -i package delete sequence

