#!/bin/bash

print_heading "setting up visual studio code started ..."
bkp_vscode=$projdir/copyfiles/vscode && src_vscode=~/Library/Application\ Support/Code/User

# check to install vs code
if ! test $(which code); then
	debug "installing vs code" && brew cask install visual-studio-code
fi
# check whether directory exists and then copy its contents
if [ -d $bkp_vscode ]; then
	[[ -d "$src_vscode" ]] && debug "copy vscode settings from $bkp_vscode/settings.json to $src_vscode" && \cp $bkp_vscode/settings.json "$src_vscode"/ && [[ -d $bkp_vscode/snippets ]] && debug "copy visual studio snippets from $src_vscode/snippets" && \cp -R "$bkp_vscode/snippets" "$src_vscode"

	cat $bkp_vscode/extensions.txt | while read LINE; do
		debug "installing extension: $LINE" && code --install-extension $LINE
	done
fi

unset bkp_vscode
print_heading "setting up visual studio code completed ..."
