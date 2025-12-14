SSH_STR=$1
SNAME="pc"
tmux new -s $SNAME -d -n "pc-app" ssh $SSH_STR
tmux new-window -t $SNAME:1 -n "pc-browse" ssh $SSH_STR

tmux send-keys -t $SNAME:0 "docker exec -it devcontainer bash" Enter
tmux send-keys -t $SNAME:0 "cd superfile; portalcode" Enter

tmux send-keys -t $SNAME:1 "docker exec -it devcontainer bash" Enter
tmux send-keys -t $SNAME:1 "cd superfile" Enter
tmux attach -t $SNAME

