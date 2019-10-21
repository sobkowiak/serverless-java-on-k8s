#!/bin/bash

# install helm
if [ ! -f $TOOLS_HOME/bin/helm  ]; then
  curl -L https://get.helm.sh/helm-v2.14.3-linux-amd64.tar.gz \
    | tar xz  -C $TOOLS_HOME/bin  --strip=1  -- */helm */tiller \
    && chmod u+x $TOOLS_HOME/bin/helm \
    && chmod u+x $TOOLS_HOME/bin/tiller
fi


# install wsk
if [ ! -f $TOOLS_HOME/bin/wsk  ]; then
  curl -L https://github.com/apache/openwhisk-cli/releases/download/1.0.0/OpenWhisk_CLI-1.0.0-linux-amd64.tgz \
    | tar xz  -C $TOOLS_HOME/bin  -- wsk \
    && chmod u+x $TOOLS_HOME/bin/wsk
fi

# install wskdeploy
if [ ! -f $TOOLS_HOME/bin/wskdeploy  ]; then
  curl -L https://github.com/apache/openwhisk-wskdeploy/releases/download/latest/openwhisk_wskdeploy-latest-linux-amd64.tgz \
    | tar xz  -C $TOOLS_HOME/bin  -- wskdeploy \
    && chmod u+x $TOOLS_HOME/bin/wskdeploy
fi