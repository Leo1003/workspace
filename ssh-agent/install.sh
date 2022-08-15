#!/usr/bin/env bash
DIR=$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P )

set -e

mkdir -p "$HOME/.config/systemd/user"
cp -i "$DIR/ssh-agent.service" "$HOME/.config/systemd/user"

systemctl --user --daemon-reload
systemctl --user enable --now ssh-agent.service

