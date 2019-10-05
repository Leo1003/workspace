_cfg_install() {
    DIR=$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P )
    if [ $# -eq 1 ]; then
        DEST=$1
    elif [ $# -eq 2 ]; then
        DEST=$2
    else
        return 1
    fi
    cp -v "$ENVROOT/configures/$1" "$HOME/$DEST"
}
