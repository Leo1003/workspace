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

# Nerd Symbol customization
starship config hostname.ssh_symbol '爵 '
starship config aws.symbol '  '
starship config buf.symbol ' '
starship config c.symbol ' '
starship config conda.symbol ' '
starship config dart.symbol ' '
starship config directory.read_only '  '
starship config docker_context.symbol ' '
starship config elixir.symbol ' '
starship config elm.symbol ' '
#starship config git_branch.symbol ' '
starship config golang.symbol ' '
starship config haskell.symbol ' '
#starship config hg_branch.symbol ' '
starship config java.symbol ' '
starship config julia.symbol ' '
starship config memory_usage.symbol ' '
starship config nim.symbol ' '
starship config nix_shell.symbol ' '
starship config nodejs.symbol ' '
starship config package.symbol ' '
starship config php.symbol ' '
starship config python.symbol ' '
starship config sudo.symbol ' '
starship config spack.symbol '🅢 '
starship config rust.symbol ' '

