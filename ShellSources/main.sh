ROOT_DIR="$(dirname $0)"
PERSONAL_ROOT="$(realpath $ROOT_DIR/..)"
SHARED_ROOT="$PERSONAL_ROOT/shared"

source $ROOT_DIR/plugin.sh
source $ROOT_DIR/app_env.sh
source $ROOT_DIR/docs.sh
source $ROOT_DIR/other.sh
source $ROOT_DIR/temp_dev.sh
source $ROOT_DIR/tooling.sh


eval "$(zoxide init zsh)"

