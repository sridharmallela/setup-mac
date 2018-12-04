#!/bin/bash

print_heading "syncing ssh started ..."

# check directory exists and copy content
[[ -d ~/.ssh ]] && debug "copy ssh config from $(dirname ~/.ssh/id_rsa)" && \cp ~/.ssh/* $projdir/dotfiles/ssh/

print_heading "syncing ssh completed ..."
