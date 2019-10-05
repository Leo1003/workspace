#!/usr/bin/env bash
DIR="$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P )"

# cp -R -v $DIR/themes $HOME/.tmux
cp -v $DIR/config.conf $HOME/.tmux.conf

if [ ! -f "${HOME}/.tmux/plugins/tpm/tpm" ]; then 
    echo 'Installing Tmux Plugin Manager...'
    git clone 'https://github.com/tmux-plugins/tpm' "${HOME}/.tmux/plugins/tpm"
fi

