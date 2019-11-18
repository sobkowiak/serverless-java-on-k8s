#!/bin/bash

function knativeSideBySide() {
  tmux select-window -t knative:0 \; \
    select-pane -t knative:0.2 \; \
    send-keys 'cd $WKS_HOME/sidebyside/hello/nodejs && reset' C-m \; \
    select-pane -t knative:0.3 \; \
    send-keys 'cd $WKS_HOME/sidebyside/hello/quarked && reset' C-m \;
};

function knativeBasic() {
  tmux select-window -t knative:0 \; \
    select-pane -t knative:0.2 \; \
    send-keys 'cd $WKS_HOME/knative-tutorial/02-basics/knative && reset' C-m \; \
    select-pane -t knative:0.3 \; \
    send-keys 'cd $WKS_HOME/knative-tutorial/02-basics/knative && reset' C-m \;
};

function knativeScaling() {
  tmux select-window -t knative:0 \; \
    select-pane -t knative:0.2 \; \
    send-keys 'cd $WKS_HOME/knative-tutorial/04-scaling/knative && reset' C-m \; \
    select-pane -t knative:0.3 \; \
    send-keys 'cd $WKS_HOME/knative-tutorial/04-scaling/knative && reset' C-m \;
};

function knativeRoot() {
  tmux select-window -t knative:0 \; \
    select-pane -t knative:0.2 \; \
    send-keys 'cd $WKS_HOME/serverless-java/knative && reset' C-m \; \
    select-pane -t knative:0.3 \; \
    send-keys 'cd $WKS_HOME/serverless-java/knative && reset' C-m \;
};

function knativeGreeter() {
  tmux select-window -t knative:0 \; \
    select-pane -t knative:0.2 \; \
    send-keys 'cd $WKS_HOME/knative-tutorial/apps/greeter/java/quarkus && reset' C-m \; \
    select-pane -t knative:0.3 \; \
    send-keys 'cd $WKS_HOME/knative-tutorial/apps/greeter/java/springboot && reset' C-m \;
};

function openwhiskMemory() {
  tmux select-window -t openwhisk:0 \; \
    select-pane -t openwhisk:0.0 \; \
    send-keys 'cd $WKS_HOME/openwhisk-memory-java-javascript && reset' C-m \; \
    select-pane -t openwhisk:0.1 \; \
    send-keys 'cd $WKS_HOME/openwhisk-memory-java-javascript && reset' C-m \;
};

function openwhiskRoot() {
  tmux select-window -t openwhisk:0 \; \
    select-pane -t openwhisk:0.0 \; \
    send-keys 'cd $WKS_HOME/serverless-java/openwhisk && reset' C-m \; \
    select-pane -t openwhisk:0.1 \; \
    send-keys 'cd $WKS_HOME/serverless-java/openwhisk && reset' C-m \;
};

function quarkusRoot() {
  tmux select-window -t knative:0 \; \
    select-pane -t knative:0.2 \; \
    send-keys 'cd $WKS_HOME/quarkus && reset' C-m \; \
    select-pane -t knative:0.3 \; \
    send-keys 'cd $WKS_HOME/quarkus && reset' C-m \;
};
