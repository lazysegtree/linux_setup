wrap_green(){
    '\[\033[01;32m\]\u\[\033[00m\]'
}
if [[ $SHELL_NAME == "bash" ]]; then
    PS1='\[\033[01;34m\]\w\[\033[00m\][\t] \$ '
fi