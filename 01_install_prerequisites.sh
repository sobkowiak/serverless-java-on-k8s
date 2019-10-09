#!/bin/bash

source 00_setenv.sh

if [ ! -f $TOOLS_HOME/bin ]; then
  mkdir -p $TOOLS_HOME/bin;
fi

sudo dnf install -y siege httpie httpd-tools jq

if [ ! -f $TOOLS_HOME/bin/yq ]; then
  curl -L https://github.com/mikefarah/yq/releases/download/2.4.0/yq_linux_amd64 -o  $TOOLS_HOME/bin/yq\
    && chmod u+x $TOOLS_HOME/bin/yq
fi

# install hey
# https://github.com/rakyll/hey

if [ ! -f $TOOLS_HOME/bin/hey ]; then
  curl -L https://storage.googleapis.com/hey-release/hey_linux_amd64 -o $TOOLS_HOME/bin/hey \
    && chmod u+x $TOOLS_HOME/bin/hey
fi