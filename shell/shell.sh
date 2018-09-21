SHELLTYPE="$(ps -p $$ -ocomm=)"

case "$SHELLTYPE" in
    zsh)
        DIR="$( cd "$(dirname "${(%):-%N}")" ; pwd -P )"
        ;;
    *)
        DIR="$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P )"
        ;;
esac

eval . "${DIR}/alias.sh"
eval . "${DIR}/configures/environments.sh"

case "$SHELLTYPE" in
    bash)
        for file in ${DIR}/alias/bash/*.sh
        do
            . $file
        done
        ;;
    zsh)
        for file in ${DIR}/alias/zsh/*.zsh
        do
            . $file
        done
        if [ -f "${HOME}/.oh-my-zsh/oh-my-zsh.sh" ]; then
            . "${DIR}/configures/oh-my-zsh.zsh"
        fi
        ;;
    *)
        ;;
esac
