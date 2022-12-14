caprun() {
    local caps="$1"
    shift

    sudo capsh --caps="$caps+eip cap_setpcap,cap_setuid,cap_setgid+ep" \
        --keep=1 --user="$USER" --addamb="$caps" -- -c "$*"
}
