if type systemctl 2>/dev/null 1>&2; then
    alias sc='sudo systemctl'
    alias scu='systemctl --user'
    alias scrl='sudo systemctl daemon-reload'
fi
