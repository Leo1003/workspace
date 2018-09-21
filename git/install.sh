#!/bin/bash
DIR="$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P )"

eval cp -v "${DIR}/gitconfig" "${HOME}/.gitconfig"
