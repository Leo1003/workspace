if has_command systemctl; then
    alias sc='sudo systemctl'
    alias scu='systemctl --user'
    alias scrl='sudo systemctl daemon-reload'
fi
