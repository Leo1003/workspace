#!/usr/bin/env bash
DIR=$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P )

ln -sinv "$DIR/vimrc" "$HOME/.vimrc"

if [ ! -f "$HOME/.vim/autoload/plug.vim" ]; then
    echo 'Installing vim-plug...'
    curl -fLo "$HOME/.vim/autoload/plug.vim" --create-dirs 'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
fi
cp -iv "$DIR/plug.local.vim" "$HOME/.vim/plug.local.vim"

ln -sfnv "$DIR/vimrc-plug" "$HOME/.vimrc-plug"

# Run vim to install plugins
vim +PluginInstall +qall

