#!/bin/bash

DIR="$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P )"

cp "$DIR/gdbinit" "$HOME/.gdbinit"
if [ ! -f "$HOME/.peda/peda.py" ]; then
    git clone 'https://github.com/longld/peda' "$HOME/.peda"
fi
patch -s "$HOME/peda/lib/config.py" -i "$DIR/peda-patch/config.patch"
