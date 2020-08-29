#!/bin/bash

tmux new -d -s nethack-server
tmux send-keys -t nethack-server "./dev/run-nethack-server.sh" C-m
