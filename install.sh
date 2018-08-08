#!/bin/bash
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

choices=$(dialog --separate-output --stdout --checklist 'Select what to install' 0 0 0 \
    'Shell environment' 'Alias and environment variables' off \
    'Git config' 'Basic git config' off \
    'GDB' 'GDB peda configures' off \
    'SSH-agent' 'SSH-agent autostart using systemd' off \
    'SSH-agent_KDE' 'SSH-agent autostart using KDE plasma' off \
    'SSH-add' 'Auto add key using systemd' off \
    'SSH-add_KDE' 'Auto add key using KDE plasma' off \
    'Konsole' 'Konsole profiles' off \
    'Tmux powerline' 'Tmux powerline theme' off \
    'Vimrc' 'Vim personal settings' off)

if [ $? -eq 0 ]; then
        IFS=$'\n'
        for choice in $choices
        do
            echo "You chose: $choice"
        done
else
        echo 'Installtion canceled.'
fi
