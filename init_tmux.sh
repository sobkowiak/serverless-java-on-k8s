#!/bin/bash

tmux select-window -t 0 \; \
  select-pane -t 0.0 \; \
  send-keys '. 10_init.sh && reset' C-m \; \
  select-pane -t 0.1 \; \
  send-keys '. 10_init.sh && reset' C-m \; \
  select-pane -t 0.1 \; \
  select-pane -t 0.1 \; \
  send-keys '. 10_init.sh && reset' C-m \; \
  select-window -t 1 \; \
  select-pane -t 1.0 \; \
  send-keys '. 10_init.sh && reset' C-m \; \
  select-pane -t 1.1 \; \
  send-keys '. 10_init.sh && reset' C-m \; \
  select-pane -t 1.2 \; \
  send-keys '. 10_init.sh && reset' C-m \; \
  select-pane -t 1.3 \; \
  send-keys '. 10_init.sh && reset' C-m \; \
  select-window -t 0 \; \
  select-pane -t 0.0 \; \
