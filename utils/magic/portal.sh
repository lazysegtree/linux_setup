#!/bin/bash

# Save this as /workspace/dev.sh inside the container
# Then you can run: docker exec -it devcontainer bash /workspace/dev.sh

WORKSPACE_DIR="/workspace/superfile"
SNAME="main"

cd "$WORKSPACE_DIR" 2>/dev/null || cd /workspace

# Check if tmux session exists
if tmux has-session -t "$SNAME" 2>/dev/null; then
    echo "Attaching to existing tmux session..."
    exec tmux attach -t "$SNAME"
else
    tmux new-session -s $SNAME -d -n "code" portalcode --yolo
    tmux new-window -t "$SNAME":2 -n shell
    tmux move-window -s "$SNAME":0 -t "$SNAME":1
    exec tmux attach -t "$SNAME"
fi