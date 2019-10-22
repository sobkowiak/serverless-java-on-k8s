#!/bin/bash

wsk  -i action invoke /whisk.system/samples/greeting -r
wsk  -i action invoke /whisk.system/samples/greeting -r -p name "4developers" -p place Wroclaw

wsk -i trigger create every-5-seconds \
    --feed  /whisk.system/alarms/alarm \
    --param cron '*/5 * * * * *' \
    --param maxTriggers 25 \
    --param trigger_payload "{\"name\":\"4developers\",\"place\":\"Wroclaw\"}"

wsk -i rule create invoke-periodically \
    every-5-seconds \
    /whisk.system/samples/greeting


wsk -i activation poll


wsk -i rule delete invoke-periodically
wsk -i trigger delete every-5-seconds
