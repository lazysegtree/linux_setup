SNAME="magic"
tmux new -s $SNAME -d -n "magic" -c "/Users/nitin/Programming/spf_forks/magic"
tmux new-window -t $SNAME:1 -n "magic2" -c "/Users/nitin/Programming/spf_forks/magic2"
tmux attach -t $SNAME
