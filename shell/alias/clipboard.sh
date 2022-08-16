if [ "$XDG_SESSION_TYPE" = "wayland" ]; then
    if has_command wl-copy; then
        alias copy='wl-copy -n'
    fi
    if has_command wl-paste; then
        alias paste='wl-paste -n'
    fi
elif [ "$XDG_SESSION_TYPE" = "x11" ]; then
    if has_command xclip; then
        alias paste='xclip -selection clipboard -o'
        alias copy='xclip -selection clipboard -i'
    fi
fi

