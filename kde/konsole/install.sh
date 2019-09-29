#!/usr/bin/env bash
DIR=$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P )

mkdir -p "$HOME/.local/share/konsole"
eval cp -v "$DIR/*.profile" "$DIR/*.keytab" "$HOME/.local/share/konsole"

