#!/bin/bash

print_heading "syncing up brew started ..."
bkp_brew=$projdir/copyfiles/brew

# sync only if brew is installed
if [ -x $(command -v brew) ]; then
	# check if file exists already, to delete it
	[[ -e $bkp_brew/brew-list.txt ]] && debug "cleanup previous brew list" && >$bkp_brew/brew-list.txt
	# list of brew apps
	debug "capture brew list" && /usr/local/bin/brew list --full-name >>$bkp_brew/brew-list.txt
	# check if file exists already, to delete it
	[[ -e $bkp_brew/brew-cask-list.txt ]] && debug "cleanup previous brew cask list" && >$bkp_brew/brew-cask-list.txt
	# list of brew casks
	debug "capture brew cask list" && /usr/local/bin/brew cask list --full-name >>$bkp_brew/brew-cask-list.txt
fi

unset bkp_brew
print_heading "syncing up brew completed ..."
