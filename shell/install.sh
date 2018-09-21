#!/bin/bash
DIR="$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P )"

echo "source $DIR/shell.sh" >> .bashrc
echo "source $DIR/shell.sh" >> .zshrc

if [ ! -f "${HOME}/.oh-my-zsh/oh-my-zsh.sh" ]; then
    git clone 'https://github.com/robbyrussell/oh-my-zsh' "$HOME/.oh-my-zsh"
fi
