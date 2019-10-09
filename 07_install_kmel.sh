#!/bin/bash

curl -L https://github.com/apache/camel-k/releases/download/0.3.4/camel-k-client-0.3.4-linux-64bit.tar.gz \
  | tar xz  -C $TOOLS_HOME/bin --wildcards --no-anchored 'kamel' \
  && chmod u+x $TOOLS_HOME/bin/kamel