# superfile basic stuff

export SPF_FILES="$HOME/Library/Application Support/superfile"
export SPF_LOG="$HOME/Library/Application Support/superfile/superfile.log"
export SPF_SRC="$HOME/Programming/superfile"
alias build_spft="(cd $SPF_SRC && time ./build.sh)"
alias new_spft="build_spft && spft"

export BSPF_SRC="$HOME/Workspace/Other_proj/BhagatHarsh/superfile"

alias build_bspf="(cd $BSPF_SRC && time ./build.sh)"
alias new_bspf="build_bspf && bspf"
function bspf(){
    $BSPF_SRC/bin/spf
}

function myspf(){
    spft; source "$(spft path-list --lastdir-file)"
}


function spf_grepri(){
    (cd $SPF_SRC; grep -rni --exclude-dir ./testsuite/.venv --exclude-dir ./website/node_modules  . "$@")
}
function spf_go_grepri(){
    (cd $SPF_SRC/src; grep -rni --exclude-dir ./testsuite/.venv --exclude-dir ./website/node_modules  . "$@")
}
function spfc(){
    code "${SPF_FILES}/config.toml"
}
function spfh(){
    code "${SPF_FILES}/hotkeys.toml"
}

SPF_CONFIGS="${SHARED_PERSONAL_ROOT}/Temp/spf_configs"

function spfr_first_time() {
    SPFDIR="${SPF_CONFIGS}/first_time"
    find "$SPFDIR" -mindepth 1 -delete
    env XDG_STATE_HOME="${SPFDIR}" \
        XDG_DATA_HOME="${SPFDIR}" \
        HOME="${SPFDIR}" \
        "$@"
}

function spfr_no_xdgdir() {
    SPFDIR="${SPF_CONFIGS}/no_home_dir"
    env XDG_DESKTOP_DIR="${SPFDIR}/non_existing_dir" \
	    XDG_DOWNLOAD_DIR="${SPFDIR}/non_existing_dir" \
	    XDG_DOCUMENTS_DIR="${SPFDIR}/non_existing_dir" \
	    XDG_MUSIC_DIR="${SPFDIR}/non_existing_dir" \
	    XDG_PICTURES_DIR="${SPFDIR}/non_existing_dir" \
	    XDG_VIDEOS_DIR="${SPFDIR}/non_existing_dir" \
	    XDG_TEMPLATES_DIR="${SPFDIR}/non_existing_dir" \
	    XDG_PUBLICSHARE_DIR="${SPFDIR}/non_existing_dir" \
        "$@"
}

function spfr_huge_sidebar() {
    SPFDIR="${SPF_CONFIGS}/huge_sidebar"
    env XDG_STATE_HOME="${SPFDIR}" \
        XDG_DATA_HOME="${SPFDIR}" \
        "$@"
}



# ================= Archived


SPF_TESTDIR="$HOME/temp/testf"
function spf_gen_testfiles() {
    if [ -n "$SPF_TESTDIR" ]; then
        SPF_TESTDIR="."
    fi

    rm -rf ${SPF_TESTDIR}/gen1

    DIR1="${SPF_TESTDIR}/gen1"
    mkdir -p "${DIR1}" 

    echo "Writing root files"

    # few files
    for i in $(seq 1 10); do 
        truncate -s 10K ${DIR1}/10K_${i}.dat
    done 

    truncate -s 10M ${DIR1}/10M_1.dat
    truncate -s 10M ${DIR1}/10M_2.dat
    truncate -s 100M ${DIR1}/100M_1.dat

    echo "Writing Group A"

    mkdir -p "${DIR1}/10Kfiles"
    for i in $(seq 1 10000); do 
        echo "File Group A, File ${i}" >  "${DIR1}/10Kfiles/ga_f${i}.txt"
    done

    echo "Writing Group B"    
    mkdir -p "${DIR1}/1file"
    echo "File Group B, File 1" > "${DIR1}/1file/gb_f1.txt"

    for i in $(seq 1 3); do
        mkdir -p "${DIR1}/nofiles_${i}"
    done
   
}

function spf_func(){
    spf --print-last-dir > .dir
    cat .dir
    cd "$(cat .dir)"
}
alias spf_alias="DIR=\$(spf --print-last-dir); cd \"\$DIR\""
