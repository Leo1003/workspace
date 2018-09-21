#!/bin/bash
DIR=$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P )

cp -v $DIR/vimrc $HOME/.vimrc
mkdir $HOME/.vim
cp -R -v $DIR/colors $HOME/.vim/
