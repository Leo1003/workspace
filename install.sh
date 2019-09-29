#!/usr/bin/env bash
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

choices=$(dialog --separate-output --stdout --checklist 'Select what to configure' 0 0 0 \
    'Shell' 'Alias and environment variables' off \
    'Git' 'Basic git config' off \
    'GDB' 'GDB peda configures' off \
    'SSH-agent' 'SSH-agent autostart using systemd' off \
    'SSH-agent_KDE' 'SSH-agent autostart using KDE plasma' off \
    'SSH-add' 'Auto add key using systemd' off \
    'SSH-add_KDE' 'Auto add key using KDE plasma' off \
    'Konsole' 'Konsole profiles' off \
    'Tmux' 'Tmux powerline theme' off \
    'Vim' 'Vim personal settings' off)

retval=$?

clear

get_pwd() {
    echo "$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P )"
}

ENVROOT=`get_pwd`

if [ $retval -eq 0 ]; then
        IFS=$'\n'
        for choice in $choices
        do
            echo "Installing: $choice"
            case $choice in
                'Shell')
                    . "$ENVROOT/shell/install.sh"
                    ;;
                'Git')
                    . "$ENVROOT/git/install.sh"
                    ;;
                'GDB')
                    . "$ENVROOT/gdb/install.sh"
                    ;;
                'SSH-agent')
                    echo 'Not implemented!'
                    ;;
                'SSH-agent_KDE')
                    echo 'Not implemented!'
                    ;;
                'SSH-add')
                    echo 'Not implemented!'
                    ;;
                'SSH-add_KDE')
                    echo 'Not implemented!'
                    ;;
                'Konsole')
                    . "$ENVROOT/kde/konsole/install.sh"
                    ;;
                'Tmux')
                    . "$ENVROOT/tmux/install.sh"
                    ;;
                'Vim')
                    . "$ENVROOT/vim/install.sh"
                    ;;
            esac
        done
else
    echo 'Installtion canceled.'
fi
