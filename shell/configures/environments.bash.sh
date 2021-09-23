if has_command starship; then
    eval "$(starship init bash)"
fi

try_scripts "/usr/share/doc/pkgfile/command-not-found.bash"

