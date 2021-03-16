#!/usr/bin/env bash
DIR=$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P )

confirm() {
    # call with a prompt string or use a default
    read -r -p "${1:-Are you sure? [y/N]} " response
    case "$response" in
        [yY][eE][sS]|[yY]) 
            true
            ;;
        *)
            false
            ;;
    esac
}

if [ -f "$HOME/.vimrc" ]; then
    if [ ! -h "$HOME/.vimrc" ]; then
        confirm "This would overwrite your .vimrc file! continue? [y/N] " && ln -sfv "$DIR/vimrc" "$HOME/.vimrc"
    else
        ln -sfnv "$DIR/vimrc" "$HOME/.vimrc"
    fi
else
    ln -sv "$DIR/vimrc" "$HOME/.vimrc"
fi

if [ ! -f "$HOME/.vim/autoload/plug.vim" ]; then
    echo 'Installing vim-plug...'
    curl -fLo "$HOME/.vim/autoload/plug.vim" --create-dirs 'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
fi
cp -v "$DIR/plug.local.vim" "$HOME/.vim/plug.local.vim"

ln -sfnv "$DIR/vimrc-plug" "$HOME/.vimrc-plug"

