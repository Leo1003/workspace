if type exa 1&>2 2> /dev/null; then
    alias ls='exa --color=auto --git'
else
    alias ls='ls --color=auto'
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
    sudo chown -R "$(id -u):$(id -g)" $1
}
