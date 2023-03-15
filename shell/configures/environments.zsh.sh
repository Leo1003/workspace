# Determine if zsh-syntax-highlighting exists
try_scripts \
    "/usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" \
    "/usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" \
    "/usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"

# Try load zsh-autosuggestions
try_scripts \
    "/usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh" \
    "/usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh" \
    "/usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh"

if has_command starship; then
    eval "$(starship init zsh)"
fi

# Try load Arch Linux command-not-found script
try_scripts "/usr/share/doc/pkgfile/command-not-found.zsh"

# Allow to make a command ignored by history by prefixing with space
setopt HIST_IGNORE_SPACE
