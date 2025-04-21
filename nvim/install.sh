#!/usr/bin/env bash
set -e
DIR=$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P )

ln -sfTv "$DIR/NvChad_config" "$HOME/.config/nvim"

# Run vim to install plugins

