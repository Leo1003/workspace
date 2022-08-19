#!/usr/bin/env bash

# Checking environment
## Working Directory Setup
get_pwd() {
    echo "$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P )"
}

ENVROOT=`get_pwd`
. "$ENVROOT/utils/cfg_install.sh"

## Checking if dialog is installed
dialog --version > /dev/null
RETVAL=$?
if [ $RETVAL -eq 127 ]; then
    echo 'Dialog not found!'
    echo 'This script require dialog to work.'
    echo 'Please contact your administrator.'
    exit 1
elif [ $RETVAL -ne 0 ]; then
    echo 'Dialog error!'
    echo 'This script require dialog to work.'
    exit 1
fi

# Choosing install items
choices=$(dialog --separate-output --stdout --checklist 'Select what to configure' 0 0 0 \
    'Shell' 'Alias and environment variables' off \
    'Git' 'Basic git config' off \
    'Clang-Format' 'Configurations for clang-format' off \
    'GDB' 'GDB peda configures' off \
    'SSH-pubkey' 'SSH login public keys' off \
    'SSH-agent' 'SSH-agent autostart using systemd' off \
    'SSH-agent_KDE' 'SSH-agent autostart using KDE plasma' off \
    'SSH-add' 'Auto add key using systemd' off \
    'SSH-add_KDE' 'Auto add key using KDE plasma' off \
    'Konsole' 'Konsole profiles' off \
    'Tmux' 'Tmux powerline theme' off \
    'Vim' 'Vim personal settings' off)

retval=$?

clear

# Install scripts
if [ $retval -eq 0 ]; then
        IFS=$'\n'
        for choice in $choices
        do
            echo "Installing: $choice"
            case $choice in
                'Shell')
                    "$ENVROOT/shell/install.sh"
                    ;;
                'Git')
                    "$ENVROOT/git/install.sh"
                    ;;
                'GDB')
                    "$ENVROOT/gdb/install.sh"
                    ;;
                'Clang-Format')
                    _cfg_install '.clang-format'
                    ;;
                'SSH-pubkey')
                    "$ENVROOT/sshkeys/install.sh"
                    ;;
                'SSH-agent')
                    "$ENVROOT/ssh-agent/install.sh"
                    ;;
                'PAM SSH-add')
                    "$ENVROOT/pam_load_sshkey/install.sh"
                    ;;
                'Starship')
                    "$ENVROOT/starship/install.sh"
                    ;;
                'Konsole')
                    "$ENVROOT/kde/konsole/install.sh"
                    ;;
                'Tmux')
                    "$ENVROOT/tmux/install.sh"
                    ;;
                'Vim')
                    "$ENVROOT/vim/install.sh"
                    ;;
            esac
        done
else
    echo 'Installtion canceled.'
fi

