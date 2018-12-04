#!/bin/bash

print_heading "syncing visual studio code started ..."
bkp_vscode=$projdir/copyfiles/vscode/extensions.txt && src_vscode=~/Library/Application\ Support/Code/User

# check directory exists and copy content
[[ -d "$src_vscode" ]] && [[ -e "$src_vscode"/settings.json ]] && debug "copy visual studio config from $src_vscode/settings.json" && \cp "$src_vscode/settings.json" $projdir/copyfiles/vscode/ && [[ -d "$src_vscode"/snippets ]] && debug "copy visual studio snippets from $src_vscode/snippets" && \cp -R "$src_vscode/snippets" $projdir/copyfiles/vscode/
if [ -x $(command -v code) ]; then
	# remove existing file to avoid appending data
	[[ -e $bkp_vscode ]] && debug "cleanup existing visual studio code file $bkp_vscode" && >$bkp_vscode
	debug "list all vscode extensions" && /usr/local/bin/code --list-extensions >>$bkp_vscode
fi

unset bkp_vscode && unset src_vscode
print_heading "syncing visual studio code completed ..."
