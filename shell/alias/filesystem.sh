if type exa 2> /dev/null 1>&2; then
    alias ls='exa --color=auto --git'
elif type lsd 2> /dev/null 1>&2; then
    alias ls='lsd --color=auto --size=short'
fi
alias lp='ls -alh'
alias la='ls -a'
alias ll='ls -lh'
alias ds='dirs -p -v'
alias cp='cp -i'
alias mv='mv -i'
alias cpp='cp -pi'
alias cpa='cp -a'
alias cpr='cp -R'
alias lssd='find /dev/ -type b -exec sh -c "ls --color=always -lh {}" \;'

takeown() {
    sudo chown -R "$(id -u):$(id -g)" "$@"
}
