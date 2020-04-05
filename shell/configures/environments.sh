export GOPATH=~/go
export PATH=~/bin:~/.local/bin:$PATH
export VISUAL=vim
export EDITOR=vim
if [ -d "$HOME/go/bin" ]; then
    export PATH="$HOME/go/bin":$PATH
fi

if [ -d "$HOME/.cargo/bin" ]; then
    export PATH="$HOME/.cargo/bin":$PATH
fi
