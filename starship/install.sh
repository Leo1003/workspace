#!/usr/bin/env bash
DIR="$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P )"

if ! command -v "starship" > /dev/null 2>&1; then
    echo "starship command not found." >&2
    exit 1
fi

starship config add_newline false
starship config cmd_duration.min_time 1
starship config time.disabled false
starship config username.show_always true
