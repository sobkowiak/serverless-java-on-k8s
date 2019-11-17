#!/bin/bash

function postInitKnativeTmux() {
  tmux select-window -t knative:0 \; \
    select-pane -t knative:0.0 \; \
    send-keys '. 10_init.sh && reset' C-m \; \
    select-pane -t knative:0.1 \; \
    send-keys '. 10_init.sh && reset' C-m \; \
    select-pane -t knative:0.2 \; \
    send-keys '. 10_init.sh && reset' C-m \; \
    select-pane -t knative:0.3 \; \
    send-keys '. 10_init.sh && reset' C-m \; \
    select-window -t knative:0 \; \
    select-pane -t knative:0.0 \;
};


function postInitOpenWhiskTmux() {
  tmux select-window -t openwhisk:0 \; \
    select-pane -t openwhisk:0.0 \; \
    send-keys '. 10_init.sh && reset' C-m \; \
    select-pane -t openwhisk:0.1 \; \
    send-keys '. 10_init.sh && reset' C-m \; \
    select-pane -t openwhisk:0.2 \; \
    send-keys '. 10_init.sh && reset' C-m \; \
    select-window -t openwhisk:0 \; \
    select-pane -t openwhisk:0.0 \;
};

postInitKnativeTmux
postInitOpenWhiskTmux




