#!/bin/bash

print_heading "setting up bash files started ..."
bkp_bash=$projdir/dotfiles/bash

# check whether directory exists and then copy its contents
[[ -d $bkp_bash ]] && debug "copy all bash files from $bkp_bash" && \cp -r $bkp_bash/. ~/

unset bkp_bash
print_heading "setting up bash files completed ..."
