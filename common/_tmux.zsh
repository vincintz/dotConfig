# setup tmux windows
if [[ ! -z $TMUX ]]; then
    tmux rename-window 'ws' \; \
         split-window -v -p 25 \; \
         split-window -h -p 60 \; \
         select-pane  -U \; \
         split-window -h -p 25 \; \
         select-pane  -L \;
    tmux new-window \; \
         rename-window 'ssh' \; \
         previous-window \;
fi
