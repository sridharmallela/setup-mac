#!/bin/bash

print_heading "setting up visual studio code started"

# check to install vs code
if test ! $(which code); then
	echo "installing vs code..."
	brew cask install visual-studio-code
fi

# check whether directory exists and then copy its contents
if [ -d $projdir/copyfiles/vscode ]; then
	echo "copy vscode settings....."
	\cp -v $projdir/copyfiles/vscode/settings.json ~/Library/Application\ Support/Code/User/
	echo "installing vscode extensions list....."
	cat $projdir/copyfiles/vscode/extensions.txt | while read LINE; do
		echo "installing extension: $LINE"
		code --install-extension $LINE
	done
fi

print_heading "setting up visual studio code completed"
