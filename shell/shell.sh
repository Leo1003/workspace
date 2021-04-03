SHELLTYPE="$(ps -p $$ -ocomm=)"

load_script() {
    if [ -f $1 ]; then
        . $1
        CUSTOMFILE="${1%.*}.custom.${1##*.}"
        if [ -f $CUSTOMFILE ]; then 
            . $CUSTOMFILE
        fi
    fi
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
        load_script "${DIR}/configures/oh-my-zsh.zsh"
    fi
    # Load oh my zsh
    source $ZSH/oh-my-zsh.sh

    # Determine zsh-syntax-highlighting if exists
    if [ -f /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]; then
        source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
    elif [ -f /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]; then
        source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
    elif [ -f /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]; then
        source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
    fi
fi

# Load environment configures
load_script "${DIR}/configures/environments.sh"
# Load shell specify scripts
load_script "${DIR}/configures/environments.${SHELLTYPE}.sh"

# Load shell specify scripts
case "$SHELLTYPE" in
    bash)
        for file in ${DIR}/alias/bash/*.sh
        do
            load_script $file
        done
        ;;
    zsh)
        for file in ${DIR}/alias/zsh/*.zsh
        do
            load_script $file
        done
        ;;
    *)
        for file in ${DIR}/alias/${SHELLTYPE}/*.sh
        do
            load_script $file
        done
        ;;
esac

# Load all scripts under alias directory
for file in ${DIR}/alias/*.sh
do
    load_script $file
done
alias aliasf='alias | grep'

unset load_script

