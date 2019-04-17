#!/bin/bash
DIR="$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P )"

echo "source $DIR/shell.sh" >> .bashrc
echo "source $DIR/shell.sh" >> .zshrc

if [ ! -n "$ZSH" ]; then
    ZSH="$HOME/.oh-my-zsh"
fi

if [ ! -d "$ZSH" ]; then
    git clone --depth=1 'https://github.com/robbyrussell/oh-my-zsh' "$HOME/.oh-my-zsh"
fi
