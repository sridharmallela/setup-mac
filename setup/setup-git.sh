#!/bin/bash

print_heading "setting up git projects started ..."
bkp_git=$projdir/dotfiles/git

# check to install git
if ! test $(which git); then
	debug "installing git..." && brew install git
fi
# check whether directory exists and then copy its contents
if [ -d $bkp_git ]; then
	# git config files
	debug "copy gitattributes to $(dirname ~/Documents)" && \cp $bkp_git/.gitattributes ~/ && \cp $bkp_git/.gitignore_global ~/
	debug "setting up config ...."
	# logs commit history upto last pull on the branch
	git config --global alias.lg 'log --color --graph --pretty=format:"%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset" --abbrev-commit'
	# to fix trailing whitespace
	git config --global apply.whitespace 'fix'
	# avoid having messy “Merge branch ‘master’ into …” commits by rebasing
	git config --global branch.autosetuprebase always
	# uses ios helper for storing credentials
	git config --global credential.helper osxkeychain
	# list all extra attributes
	git config --global core.attributesfile '~/.gitattributes'
	# Prevent line ending issues input for mac and true for windows
	git config --global core.autocrlf input
	# 0 for no compression; 9 for best compression, 1 for Fastest Compression, -1 for ZLIB to decide
	# 9 will take longer to compress, but always good to have
	git config --global core.compression 9
	# choose your default editor
	git config --global core.editor 'code --wait'
	# global ignore file applied to all repos
	git config --global core.excludesfile '~/.gitignore_global'
	# make sure git captures changes to file mode (RWX chmod)
	git config --global core.fileMode true
	# Setting it globally to "false" will enforce the rebase process to stop relying on the file system info alone
	git config --global core.trustctime false
	# to speed up "git status" and similar index operations significantly
	git config --global core.untrackedcache true
	# preset to detect and fix some whitespace issues. It can look for six primary whitespace issues
	git config --global core.whitespace 'space-before-tab,-indent-with-non-tab,trailing-space,tab-in-indent,cr-at-eol'
	# colorful terminal for GIT
	git config --global color.ui true
	git config --global color.branch true
	git config --global color.diff true
	git config --global color.interactive true
	git config --global color.pager true
	git config --global color.status true
	# using sh scripting
	git config --global color.sh auto
	git config --global color.sh.branch 'yellow reverse'
	git config --global color.sh.workdir 'blue bold'
	git config --global color.sh.dirty 'red'
	git config --global color.sh.dirty-stash 'red'
	git config --global color.sh.repo-state 'red'
	# enabled, these characters are chosen as described in the documentation you quoted
	git config --global diff.mnemonicprefix false
	# set to "false", no rename detection. set to "true", basic rename detection. set to "copies" or "copy" will detect copies
	git config --global diff.renames true
	# tools for difference between files
	git config --global diff.tool vimdiff
	# automatically remove history for remote deleted branches
	git config --global fetch.prune true
	# formatting patten to print while merging
	git config --global format.pretty oneline
	# quicker way of searching via git
	git config --global grep.extendedregexp true
	# show line numbers on grep outputs
	git config --global grep.linenumber true
	# tool for showing merge requests
	git config --global merge.tool vimdiff
	# turn it on for populating log meessages
	git config --global merge.log false
	# set to no/false if u want to turn off fast forwarding
	git config --global merge.ff true
	# dont add a commit on fast forwarding
	git config --global merge.commit true
	# use simple technique while pushing info
	git config --global push.default simple
	# user name for repo
	git config --global user.name 'Sridhar Mallela'
	# email for repo
	git config --global user.email 'smallela.projworks@gmail.com'
	# this is helpful when retrieving stuff from github or bitbucket
	git config --global url.'https://'.insteadOf git://
	# my github username
	git config --global github.user sridharmallela
	# check whether directory exists and then copy its contents
	[[ ! -d ~/git ]] && debug "making directory $(dirname ~/git)/git" && \mkdir ~/git
	debug "changing directory to git" && \cd ~/git
	cat $bkp_git/git-apps.txt | while read LINE; do
		separator && debug "cloning project $LINE" && git clone $LINE
	done
	unset LINE
fi

unset bkp_git
print_heading "setting up git projects ended ..."
