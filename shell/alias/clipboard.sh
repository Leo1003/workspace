alias xpaste='xclip -selection clipboard -o'
alias xcopy='xclip -selection clipboard -i'
fcopy() {
    cat "$1" | xcopy
}
