#!/usr/bin/env bash
DIR="$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P )"

if ! sudo -v; then
    echo "This setup requires root privilege to install."
    exit 1
fi

sudo install -m0755 "$DIR/pam_load_tpm2_sshkey" "$DIR/pam-ssh-askpass" "/usr/local/bin"
echo "Add the following entries into your PAM configuration:"
echo "auth       optional                    pam_exec.so expose_authtok /usr/local/bin/pam_load_tpm2_sshkey"
echo

