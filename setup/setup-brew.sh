#!/bin/bash

print_heading "setting up brew started ..."
bkp_brew=$projdir/copyfiles/brew

# install command-line tools using Homebrew.
# check for Homebrew, install if we don't have it
if ! test $(which brew); then
	# install latest command line tools
	debug "install xcode command line tools" && xcode-select --install
	# accept license from xcode
	debug "accept xcode license" && sudo xcodebuild -license accept
	# installing brew...
	debug "installing homebrew might take a while to update command line tools..." && ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
	# check brew installed version
	debug "checking brew version $(brew --version)" || brew --version
	# add taps
	debug "tap all available taprooms" && brew tap caskroom/cask && brew tap caskroom/fonts && brew tap caskroom/versions && brew tap caskroom/drivers
	# update to get latest brew
	debug "running brew update" && brew update && separator
fi
# check whether file exists and then read its contents
if [ -e $bkp_brew/brew-list.txt ]; then
	# start installing
	brew_list=$(cat $bkp_brew/brew-list.txt | tr "\n" " ")
	if [ ! -z "$brew_list" ]; then
		info "installing \"$brew_list\" , might take a while to complete so be patient..." && brew install $brew_list
		# cleanup all the temp downloads # use brew doctor
		debug "running brew cleanup and brew doctor " && brew cleanup && brew doctor && separator
	fi
	unset brew_list
fi
# check whether file exists and then read its contents
if [ -e $bkp_brew/brew-cask-list.txt ]; then
	# start installing cask
	brew_cask_list=$(cat $bkp_brew/brew-cask-list.txt | tr "\n" " ")
	if [ ! -z "$brew_cask_list" ]; then
		info "installing casks, \"$brew_cask_list\" , might take a while to complete so be patient..." && brew cask install $brew_cask_list
		# cleanup all the temp downloads # use brew doctor
		debug "running brew cleanup and brew cask doctor " && brew cleanup && brew cask doctor
	fi
	unset brew_cask_list
fi

# unset remianing variables
unset bkp_brew
print_heading "setting up brew completed ..."
