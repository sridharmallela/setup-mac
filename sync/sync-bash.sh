#!/bin/bash

print_heading "syncing bash files started ..."
bkp_bash=$projdir/dotfiles/bash/

# check bash profile exists and then take a backup all dotfiles
if [ -e ~/.bash_profile ]; then
	debug "copy bash_aliases to $bkp_bash" && \cp ~/.bash_aliases $bkp_bash
	debug "copy bash_profile to $bkp_bash" && \cp ~/.bash_profile $bkp_bash
	debug "copy bash_prompt to $bkp_bash" && \cp ~/.bash_prompt $bkp_bash
	debug "copy bashrc to $bkp_bash" && \cp ~/.bashrc $bkp_bash
	debug "copy inputrc to $bkp_bash" && \cp ~/.inputrc $bkp_bash
	debug "copy nanorc to $bkp_bash" && \cp ~/.nanorc $bkp_bash
fi

unset bkp_bash
print_heading "syncing bash files completed ..."
