#!/bin/bash

print_heading "setting up ssh started ..."
bkp_ssh=$projdir/dotfiles/ssh

# check whether ssh folder exists
[[ ! -d ~/.ssh ]] && debug "creating .ssh folders from $(dirname ~/Documents)/.ssh" && \mkdir ~/.ssh
# check whether directory exists and then copy its contents
[[ -d ~/.ssh ]] && [[ -d $bkp_ssh ]] && debug "copy id_rsa, id_rsa.pub, known_hosts from $bkp_ssh to $(dirname ~/Documents)/.ssh " && \cp $bkp_ssh/* ~/.ssh/ && debug "change permissions for $(dirname ~/.ssh/)/id_rsa" && \chmod 400 ~/.ssh/id_rsa

unset bkp_ssh
print_heading "setting up ssh completed ..."
