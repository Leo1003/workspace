#!/usr/bin/env bash
set -e
DIR=$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P )

if [ ! -d "$HOME/.config/nvim" ]; then
    echo "Installing NvChad..." >&2
    git clone https://github.com/NvChad/NvChad "$HOME/.config/nvim" --depth 1
else
    echo "Found existing configuration in ~/.config/nvim ..." >&2
    echo "Not to install NvChad" >&2
fi

ln -sfTv "$DIR/NvChad_custom" "$HOME/.config/nvim/lua/custom"

# Run vim to install plugins

