#!/usr/bin/env bash

TITLE="${1:-ws}"
if [[ -z $TMUX ]]; then
    tmux new-session -s ws \; \
         rename-window "${TITLE}" \; \
         split-window -v -p 25 \; \
         split-window -h -p 50 \; \
         select-pane  -L \; \
         new-window \; \
         rename-window 'ssh' \; \
         previous-window \;

else
    tmux rename-window "${TITLE}" \; \
         split-window -v -p 25 \; \
         split-window -h -p 50 \; \
         select-pane  -L \; \
         new-window \; \
         rename-window 'ssh' \; \
         previous-window \;
fi
