#!/bin/bash

wsk -i action list
wsk -i package list

wsk -i action create msgaction msgaction.js

wsk -i action invoke msgaction -r -p body '{"text":"Tech Talk SE"}'
wsk -i action invoke msgaction  -p body '{"text":"Tech Talk SE"}'
wsk -i activation result 870705b7998543ce8705b7998533ce48
wsk -i activation list -l 3

wsk -i action update msgaction msgaction.py
wsk -i action invoke msgaction -r -p body '{"text":"Tech Talk SE"}'
while (true); do wsk -i action invoke msgaction -r -p body '{"text":"Tech Talk SE"}'; done

