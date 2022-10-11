#!/usr/bin/env bash
DIR="$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P )"

_cfg_install() {
    if [ $# -eq 1 ]; then
        DEST=$1
    elif [ $# -eq 2 ]; then
        DEST=$2
    else
        return 1
    fi

    BASE_DIR=`dirname "$HOME/$DEST"`
    if [ ! -d "$BASE_DIR" ]; then
        mkdir -p "$BASE_DIR"
    fi
    cp -v "$DIR/$1" "$HOME/$DEST"
}

_cfg_install '.clang-format'
_cfg_install 'yamllint.yml' '.config/yamllint/config'

