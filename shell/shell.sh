SHELLTYPE="$(ps -p $$ -ocomm=)"

case "$SHELLTYPE" in
    bash)
        D="$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P )"
        ;;
    *)
        D="$( cd "$(dirname "$0")" ; pwd -P )"
        ;;
esac

eval . "${D}/alias.sh"
eval . "${D}/configures/environments.sh"

case "$SHELLTYPE" in
    bash)
        for file in ${D}/alias/bash/*.sh
        do
            . $file
        done
        ;;
    zsh)
        for file in ${D}/alias/zsh/*.zsh
        do
            . $file
        done
        if [ -f "${HOME}/.oh-my-zsh/oh-my-zsh.sh" ]; then
            . "${D}/configures/oh-my-zsh.zsh"
        fi
        ;;
    *)
        ;;
esac
