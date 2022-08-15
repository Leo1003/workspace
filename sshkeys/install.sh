#!/usr/bin/env bash
DIR="$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P )"

add_authorized_key() {
    if [ -z "$1" ]; then
        return
    fi
    local part_key=`echo "$1" | cut -d ' ' -f 1-2`

    if ! grep "$part_key" "$HOME/.ssh/authorized_keys" > /dev/null; then
        echo "$1" >> "$HOME/.ssh/authorized_keys"
        echo "Installed ssh key: $(echo "$1" | ssh-keygen -lf /dev/stdin)"
    else
        echo "Existed ssh key: $(echo "$1" | ssh-keygen -lf /dev/stdin)"
    fi
}

rm_authorized_key() {
    if [ -z "$1" ]; then
        return
    fi
    local part_key=`echo "$1" | cut -d ' ' -f 1-2`

    if grep "$part_key" "$HOME/.ssh/authorized_keys" > /dev/null; then
        sed -i "\\|$part_key|d" "$HOME/.ssh/authorized_keys"
        echo "Revoked ssh key: $(echo "$1" | ssh-keygen -lf /dev/stdin)"
    fi
}

mkdir -p "$HOME/.ssh"
chmod 700 "$HOME/.ssh"
touch "$HOME/.ssh/authorized_keys"
chmod 600 "$HOME/.ssh/authorized_keys"

while IFS= read -r pubkey; do
    if [ -n "$pubkey" ]; then
        add_authorized_key "$pubkey"
    fi
done < "$DIR/authorized_keys"

while IFS= read -r pubkey; do
    if [ -n "$pubkey" ]; then
        rm_authorized_key "$pubkey"
    fi
done < "$DIR/revoked_keys"

