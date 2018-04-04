#!/bin/bash

print_heading "setting up brew started"

echo "install xcode command line tools"
xcode-select --install

echo "accept xcode license"
sudo xcodebuild -license accept

# install command-line tools using Homebrew.
# check for Homebrew, install if we don't have it
if test ! $(which brew); then
	echo "installing homebrew..."
	ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# check versions
brew --version

echo "tap all available taprooms"
# add taps
brew tap homebrew/php
brew tap caskroom/cask
brew tap caskroom/fonts
brew tap caskroom/versions
brew tap caskroom/drivers

# update to get latest brew
brew update

# check whether file exists and then read its contents
if [ -e $projdir/copyfiles/brew/brew-list.txt ]; then
	# start installing
	echo "install all required apps...."
	echo "installing vscode extensions list....."
	list=" "
	cat $projdir/copyfiles/brew/brew-list.txt | while read LINE; do
		list="$list $LINE"
	done
	brew install $list
fi

# cleanup all the temp downloads
brew cleanup
# use brew doctor
brew doctor

# check whether file exists and then read its contents
if [ -e $projdir/copyfiles/brew/brew-cask-list.txt ]; then
	# start installing cask
	echo "install all required casks...."
	list=" "
	cat $projdir/copyfiles/brew/brew-cask-list.txt | while read LINE; do
		list="$list $LINE"
	done
	brew cask install $list
fi

# cleanup all the cask temp downloads
brew cask cleanup
# use brew cask doctor
brew cask doctor
# unset remianing variables
unset LINE
unset list
print_heading "setting up brew completed"
