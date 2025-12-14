SHELL_NAME=""
SOURCE=$0
case "$SHELL" in
    */bash)
        SHELL_NAME="bash"
        SOURCE=$BASH_SOURCE
        ;;
    */zsh)
        SHELL_NAME="zsh"
        ;;
esac


ROOT_DIR="$(dirname $SOURCE)"
PERSONAL_ROOT="$(realpath $ROOT_DIR/..)"
SHARED_ROOT="$PERSONAL_ROOT/shared"

source $ROOT_DIR/plugin.sh
source $ROOT_DIR/app_env.sh
source $ROOT_DIR/docs.sh
source $ROOT_DIR/other.sh
source $ROOT_DIR/spf.sh
source $ROOT_DIR/shell_customization.sh
source $ROOT_DIR/tooling.sh



