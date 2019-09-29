#!/usr/bin/env bash
DIR="$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P )"

cp -R -v $DIR/themes $HOME/.tmux
cp -v $DIR/config.conf $HOME/.tmux.conf
