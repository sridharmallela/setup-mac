#!/bin/bash

print_heading "syncing git settings started ..."
bkp_git=$projdir/dotfiles/git

# check git config exists and then take a backup
if [ -e ~/.gitconfig ]; then
	debug "copy gitattributes from $(dirname ~/Documents)" && \cp ~/.gitattributes $bkp_git/
	# debug "copy gitconfig from $(dirname ~/Documents)" && \cp ~/.gitconfig $bkp_git/
	debug "copy gitignore global from $(dirname ~/Documents)" && \cp ~/.gitignore_global $bkp_git/
fi
# check to install git
if [ -x $(command -v git) ]; then
	# check file exists and then delete it
	[[ -e $bkp_git/git-apps.txt ]] && debug "cleanup existing $bkp_git/git-apps.txt" && >$bkp_git/git-apps.txt
	## run through git folder to find out remote url
	debug "list all git apps" && for f in ~/git/*; do
		\cd $f && url=$(git config remote.origin.url) && [[ ! -z "$url" ]] && echo "$url" >>$bkp_git/git-apps.txt
		unset url
	done
fi

unset bkp_git
print_heading "syncing git settings completed ..."
