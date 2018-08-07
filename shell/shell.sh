SHELLTYPE="$(ps -p $$ -ocomm=)"
case "$SHELLTYPE" in
    bash)
        D="$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P )"
        for file in ${D}/alias/bash/*.sh
        do
            . $file
        done
        ;;
    zsh)
        D="$( cd "$(dirname "$0")" ; pwd -P )"
        for file in ${D}/alias/zsh/*.zsh
        do
            . $file
        done
        if [ -f "~/.oh-my-zsh/oh-my-zsh.sh" ]; then
            source "${D}/configures/oh-my-zsh.zsh"
        fi
        ;;
    *)
        D="$( cd "$(dirname "$0")" ; pwd -P )"
        ;;
esac

eval . "${D}/alias.sh"
eval . "${D}/configures/environments.sh"
