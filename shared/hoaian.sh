#!/usr/bin/env bash

SESSION_NAME="hoaian"

tmux has-session -t $SESSION_NAME >/dev/null

if [ $? != 0 ]; then
    tmux new-session -d -s $SESSION_NAME
fi

tmux attach-session -t $SESSION_NAME
