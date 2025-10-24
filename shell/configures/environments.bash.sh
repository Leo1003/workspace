if has_command starship; then
    eval "$(starship init bash)"
fi

try_scripts "/usr/share/doc/pkgfile/command-not-found.bash"

# History improvment
shopt -s histappend
shopt -s cmdhist
HISTCONTROL=ignoreboth:erasedups
HISTSIZE=50000
if [ -z "$PROMPT_COMMAND" ]; then
    PROMPT_COMMAND="history -a"
else
    PROMPT_COMMAND="$PROMPT_COMMAND; history -a"
fi
