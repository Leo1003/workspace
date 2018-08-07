D=$(dirname -- "$(readlink -f -- "$BASH_SOURCE")")

SHELLTYPE="$(ps -p $$ -ocomm=)"
source "$D/alias.sh"
source "$D/configures/environments.sh"
case "$SHELLTYPE" in
    bash)
        source "$D/alias/bash/*.sh"
        ;;
    zsh)
        source "$D/alias/zsh/*.zsh"
        if [ -f "~/.oh-my-zsh/oh-my-zsh.sh" ]; then
            source "$D/configures/oh-my-zsh.zsh"
        fi
        ;;
    *)
        ;;
esac
