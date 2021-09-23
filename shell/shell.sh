SHELLTYPE="$(ps -p $$ -ocomm=)"

load_script() {
    if [ -f "$1" ]; then
        . "$1"
        return 0
    else
        return 1
    fi
}

try_scripts() {
    for s in "$@"; do
        if load_script "$s"; then
            return 0
        fi
    done
    return 1
}

load_script_with_custom() {
    if load_script "$1"; then
        local custom_file="${1%.*}.custom.${1##*.}"
        load_script "$custom_file"
    fi
}

has_command() {
    command -v "$1" > /dev/null 2>&1
}

case "$SHELLTYPE" in
    zsh)
        DIR="$( cd "$(dirname "${(%):-%N}")" ; pwd -P )"
        ;;
    *)
        DIR="$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P )"
        ;;
esac

# Reset all alias first
unalias -a
if [ "$SHELLTYPE" = "zsh" ]; then
    if [ -f "${HOME}/.oh-my-zsh/oh-my-zsh.sh" ]; then
        load_script_with_custom "${DIR}/configures/oh-my-zsh.zsh"
    fi
    # Load oh my zsh
    . $ZSH/oh-my-zsh.sh
fi

# Load environment configures
load_script_with_custom "${DIR}/configures/environments.sh"
# Load shell specify scripts
load_script_with_custom "${DIR}/configures/environments.${SHELLTYPE}.sh"

# Load shell specify scripts
case "$SHELLTYPE" in
    bash)
        for file in ${DIR}/alias/bash/*.sh
        do
            load_script_with_custom $file
        done
        ;;
    zsh)
        for file in ${DIR}/alias/zsh/*.zsh
        do
            load_script_with_custom $file
        done
        ;;
    *)
        for file in ${DIR}/alias/${SHELLTYPE}/*.sh
        do
            load_script_with_custom $file
        done
        ;;
esac

# Load all scripts under alias directory
for file in ${DIR}/alias/*.sh
do
    load_script_with_custom $file
done
alias aliasf='alias | grep'

unset load_script_with_custom

