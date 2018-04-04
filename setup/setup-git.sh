#!/bin/bash

print_heading "setting up git projects started"

# check to install git
if test ! $(which git); then
	echo "installing git..."
	brew install git
fi

# check whether directory exists and then copy its contents
if [ -d $projdir/dotfiles/git ]; then
	echo "copy gitattributes ....."
	\cp -v $projdir/dotfiles/git/* ~/

	echo "setting up config ...."
	git config --global alias.lg 'log --color --graph --pretty=format:"%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset" --abbrev-commit'
	git config --global apply.whitespace 'fix'
	git config --global credential.helper osxkeychain
	git config --global core.attributesfile '~/.gitattributes'
	git config --global core.autocrlf input
	git config --global core.compression 9
	git config --global core.editor 'brackets --wait'
	git config --global core.excludesfile '~/.gitignore_global'
	git config --global core.fileMode true
	git config --global core.pager 'less -FRSX'
	git config --global core.trustctime false
	git config --global core.untrackedcache true
	git config --global core.whitespace 'space-before-tab,-indent-with-non-tab,trailing-space'
	git config --global color.ui true
	git config --global color.branch true
	git config --global color.'branch'.current 'yellow reverse'
	git config --global color.'branch'.local yellow
	git config --global color.'branch'.remote green
	git config --global color.diff true
	git config --global color.'diff'.meta 'yellow bold'
	git config --global color.'diff'.frag 'magenta bold'
	git config --global color.'diff'.old 'red bold'
	git config --global color.'diff'.new 'green bold'
	git config --global color.interactive true
	git config --global color.pager true
	git config --global color.status true
	git config --global color.'status'.added yellow
	git config --global color.'status'.changed green
	git config --global color.'status'.untracked red
	git config --global diff.mnemonicprefix true
	git config --global diff.renames copies
	git config --global diff.tool meld
	git config --global fetch.prune true
	git config --global format.pretty oneline
	git config --global grep.extendedregexp true
	git config --global grep.linenumber true
	git config --global merge.tool meld
	git config --global merge.log true
	git config --global merge.ff false
	git config --global push.default simple
	git config --global url.'https://'.insteadOf git://
	git config --global github.user sridharmallela

	echo "installing vscode extensions list....."
	# check whether directory exists and then copy its contents
	if [ ! -d ~/git ]; then
		\mkdir -v ~/git
	fi
fi

print_heading "setting up git projects ended"
