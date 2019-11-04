#!/bin/bash

tmux new-session -d -c /home/ksobkowiak/work/4developers/serverless-java\; \
  split-window -v \; \
  select-pane -t 0.0 \; \
  send-keys 'cd openwhisk && . 00_setenv.sh && reset' C-m \; \
  split-window -h \; \
  select-pane -t 0.1 \; \
  send-keys 'cd openwhisk && . 00_setenv.sh && reset' C-m \; \
  select-pane -t 0.2 \; \
  send-keys 'cd openwhisk && . 00_setenv.sh && reset' C-m \; \
  new-window \; \
  split-window -v \; \
  select-pane -t 1.0 \; \
  send-keys 'cd knative && . 00_setenv.sh && reset' C-m \; \
  split-window -h \; \
  select-pane -t 1.1 \; \
  send-keys 'cd knative && . 00_setenv.sh && reset' C-m \; \
  select-pane -t 1.2 \; \
  send-keys 'cd knative && . 00_setenv.sh && reset' C-m \; \
  split-window -h \; \
  select-pane -t 1.3 \; \
  send-keys 'cd knative && . 00_setenv.sh && reset' C-m \; \
  select-pane -t 1.0 \; \
  select-window -t 0 \; \
  select-pane -t 0.0 \; \
