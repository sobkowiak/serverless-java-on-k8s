#!/bin/bash

wsk -i action list
wsk -i package list


wsk -i package create greeter
wsk -i action create greeter/greeter greeter.js
wsk -i action list
wsk -i action get --summary greeter/greeter

wsk -i action invoke greeter/greeter -r
wsk -i action invoke greeter/greeter -b

wsk -i action invoke greeter/greeter
wsk -i activation list -l 3

wsk -i trigger create greeter-trigger
wsk -i rule create greeter-rule greeter-trigger greeter/greeter
wsk -i trigger fire greeter-trigger
wsk -i activation list
 
wsk -i rule delete greeter-rule
wsk -i trigger delete greeter-trigger
wsk -i action delete greeter/greeter
wsk -i package delete greeter

wskdeploy -m manifest_greeter_trigerrule.yml
wsk -i trigger fire greeter-trigger
wsk -i activation list
wsk -i activation result 4ce9ae1d2ffa45c5a9ae1d2ffa85c542
wskdeploy undeploy -m manifest_greeter_trigerrule.yml

