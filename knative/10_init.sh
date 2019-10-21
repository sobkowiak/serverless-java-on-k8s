#!/bin/bash

source 00_setenv.sh

source <(kubectl completion bash)
source <(minikube completion bash)
source <(kamel completion bash)
