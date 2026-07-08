wrap_green(){
    '\[\033[01;32m\]\u\[\033[00m\]'
}
if [[ $SHELL_NAME == "bash" ]]; then
    PS1='\[\033[01;34m\]\w\[\033[00m\][\t] \$ '
else
    PROMPT='%F{green}➜%f %F{cyan}%~%f %F{green}[%D{%H:%M:%S}.${${EPOCHREALTIME#*.}[1,3]}]%f %F{magenta}$(git_prompt_info)%f'
fi
