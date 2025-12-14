
# Custom tools
PY_CLIENT="/Users/kuknitin/Workspace/kuknitin/scripts/client_servers/webclients/py/client.py"
PY_SERVER="/Users/kuknitin/Workspace/kuknitin/shared/Python/Web/ipv4_server.py"

# ------------------------------------------------------------------------
export GO_LOCAL_ENV=1

# ------------------------------------------------------------------------
# C++
function grun(){
    g++ -std=c++17 $1 && ./a.out
}

# https://codeforces.com/blog/entry/15547
function grun2(){
    g++ -Wall -Wextra -pedantic -std=c++17 -O2 -Wshadow -Wformat=2 -Wfloat-equal -Wconversion -Wlogical-op -Wshift-overflow=2 -Wduplicated-cond -Wcast-qual -Wcast-align -D_GLIBCXX_DEBUG -D_GLIBCXX_DEBUG_PEDANTIC -D_FORTIFY_SOURCE=2 -fsanitize=address -fsanitize=undefined -fno-sanitize-recover -fstack-protector $1 && ./a.out
}
GEN="/Users/kuknitin/Workspace/kuknitin/shared/CPP/CP/Rare/Problemsetting/testcase_generation/testcase_gen.cpp"


# ------
# Kotlin
function krun(){
    kotlinc "$1" -include-runtime -d out.jar; java -jar out.jar
}


# VS code
alias code_W="code ~/Workspace"
alias code_cpp="code ~/Workspace/kuknitin/shared/CPP"
alias code_kuknitin="code ~/Workspace/kuknitin"

# ------------------------------------------------------------------------
# Git
alias gitac="git add . && git commit -m $1"
alias gitcp="git cherry-pick"
alias gitcpc="git cherry-pick --continue"
alias gitrc="git rebase --continue"
alias gitfs="git fetch origin $1 && git switch $1"
function gitacp(){
    git add .; git commit -m "$1"; git push
}
function git_diff(){
    git diff HEAD~$1 HEAD
}
alias git_glue="git add . && git commit --amend --no-edit"
function gitpu() { 
    git push -u origin $(git branch --show-current)
}
function gitrhu() {
    git reset --hard origin/$(git branch --show-current)
}
# ------------------------------------------------------------------------
# grep
function grepr(){
    if [[ $1 == "-e" ]]; then 
        shift
    fi
    grep -rni . -e $@    
}

# ------------------------------------------------------------------------
# minecraft 
# alias tl="sudo java -jar ~/Other/TLauncher-2.885/TLauncher-2.885.jar "
alias tl="/Library/Java/JavaVirtualMachines/zulu-8.jdk/Contents/Home/bin/java -jar Downloads/TLauncher.v10/TLauncher.jar"
MC_SERVER="129.148.131.176"

# ------------------------------------------------------------------------
# ssh
alias maze_solver_ssh="ssh -i ~/.ssh/maze_solver_oci opc@130.61.46.74"
alias test_vm_ssh="ssh -i ~/Workspace/kuknitin/oci_setup/ssh_keys/test_vm_oci_2.key ubuntu@140.238.224.91"

# Todo - make work
# alias ssh_history="history | grep -o 'ssh.*' | uniq -c | tail -n $(( ${$1:-10} ))"

function ssh_history(){
    cnt=$1
    if [[ cnt == "" ]] 
    then
        cnt="10"
    fi
    history | grep -v 'grep' | grep -v 'ossh' | grep -o 'ssh .*' | uniq | tail -n $cnt
}


# ----- zoxide

SHELL_NAME=""
case "$SHELL" in
    */bash)
        SHELL_NAME="bash"
        ;;
    */zsh)
        SHELL_NAME="zsh"
        ;;
esac


eval "$(zoxide init $SHELL_NAME)"