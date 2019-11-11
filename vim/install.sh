#!/usr/bin/env bash
DIR=$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P )

cp -v $DIR/vimrc $HOME/.vimrc

if [ ! -f $HOME/.vim/autoload/plug.vim ]; then
    echo 'Installing vim-plug...'
    curl -fLo ~/.vim/autoload/plug.vim --create-dirs 'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
fi

