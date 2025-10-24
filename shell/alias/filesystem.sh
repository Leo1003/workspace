if has_command eza; then
    alias ls='eza --color=auto --classify=auto --git'
elif has_command exa; then
    alias ls='exa --color=auto --classify=auto --git'
elif has_command lsd; then
    alias ls='lsd --color=auto --classify=auto --size=short'
else
    alias ls='ls --color=auto --classify=auto'
fi
alias l='ls'
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
    sudo chown -R "`id -u`:`id -g`" "$@"
}

# cp with rsync
rcp() {
    if has_command rsync; then
        rsync -rlptcP "$@"
    else
        echo "Command rsync not found." >&2
        return 255
    fi
}
