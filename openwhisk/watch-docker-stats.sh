#!/bin/bash

watch "docker stats --no-stream --format 'table {{.Container}}\t{{.CPUPerc}}\t{{.MemUsage}}\t{{.Name}}'  | awk 'NR==1 || /user-action/'"