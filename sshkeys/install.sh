#!/usr/bin/env bash
DIR="$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P )"

add_authorized_key() {
    if ! grep "$1" ~/.ssh/authorized_keys > /dev/null; then
        echo "$1" >> ~/.ssh/authorized_keys
        echo "Installed ssh key: $(echo "$1" | ssh-keygen -lf /dev/stdin)"
    fi
}

while IFS= read -r pubkey; do
    if [ -n "$pubkey" ]; then
        add_authorized_key "$pubkey"
    fi
done < "$DIR/authorized_keys"

