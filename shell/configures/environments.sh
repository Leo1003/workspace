export PATH=~/bin:~/.local/bin:$PATH
export GPG_TTY=$(tty)

if has_command nvim; then
    export VISUAL=nvim
    export EDITOR=nvim
elif has_command vim; then
    export VISUAL=vim
    export EDITOR=vim
fi

if [ ! -S "$SSH_AUTH_SOCK" ]; then
    if [ -S "$XDG_RUNTIME_DIR/ssh-agent.socket" ]; then
        export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"
    fi
fi

if [ -d "$HOME/go" ]; then
    export GOPATH=~/go
fi

if [ -d "$HOME/go/bin" ]; then
    export PATH="$HOME/go/bin":$PATH
fi

if [ -d "$HOME/.cargo/bin" ]; then
    export PATH="$HOME/.cargo/bin":$PATH
fi

