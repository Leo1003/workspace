D=$(dirname -- "$(readlink -f -- "$BASH_SOURCE")")

SHELLTYPE="$(ps -p $$ -ocomm=)"
source "$D/alias.sh"
source "$D/configures/environments.sh"
case "$SHELLTYPE" in
    bash)
        eval source "$D/alias/bash/*.sh"
        ;;
    zsh)
        eval source "$D/alias/zsh/*.zsh"
        if [ -f "~/.oh-my-zsh/oh-my-zsh.sh" ]; then
            source "$D/configures/oh-my-zsh.zsh"
        fi
        ;;
    *)
        ;;
esac
