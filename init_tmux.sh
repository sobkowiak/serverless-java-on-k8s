#!/bin/bash

function initKnativeTmux() {
  tmux kill-session -t knative;
  tmux new-session -s knative -d -c /home/ksobkowiak/work/4developers/serverless-java\; \
    split-window -v \; \
    select-pane -t 0.0 \; \
    send-keys 'cd knative && . 00_setenv.sh && reset' C-m \; \
    split-window -h \; \
    select-pane -t 0.1 \; \
    send-keys 'cd knative && . 00_setenv.sh && reset' C-m \; \
    select-pane -t 0.2 \; \
    send-keys 'cd knative && . 00_setenv.sh && reset' C-m \; \
    split-window -h \; \
    select-pane -t 0.3 \; \
    send-keys 'cd knative && . 00_setenv.sh && reset' C-m \; \
    select-window -t 0 \; \
    select-pane -t 0.0 \;
};

function initOpenWhiskTmux() {
  tmux kill-session -t openwhisk;
  tmux new-session -s openwhisk -d -c /home/ksobkowiak/work/4developers/serverless-java\; \
    split-window -v \; \
    select-pane -t 0.0 \; \
    send-keys 'cd openwhisk && . 00_setenv.sh && reset' C-m \; \
    split-window -h \; \
    select-pane -t 0.1 \; \
    send-keys 'cd openwhisk && . 00_setenv.sh && reset' C-m \; \
    select-pane -t 0.2 \; \
    send-keys 'cd openwhisk && . 00_setenv.sh && reset' C-m \; \
    select-window -t 0 \; \
    select-pane -t 0.0 \;
};


initKnativeTmux
initOpenWhiskTmux