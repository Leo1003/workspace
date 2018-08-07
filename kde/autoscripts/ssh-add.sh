#!/bin/bash
export SSH_ASKPASS="/usr/bin/ksshaskpass"
ssh-add -D -q
eval ssh-add -q $(cat ~/.ssh/KeyList) < /dev/null

