#!/bin/bash

print_heading "syncing brackets started ..."
bkp_brackets=$projdir/copyfiles/brackets && src_brackets=~/Library/Application\ Support/Brackets

# check directory exists and copy content
[[ -e "$src_brackets"/brackets.json ]] && debug "copy brackets $src_brackets to $bkp_brackets" && \cp "$src_brackets"/brackets.json $bkp_brackets/
# check for all extensions
if [ -d "$src_brackets"/extensions/user ]; then
	# remove existing file to avoid appending data
	[[ -e $bkp_brackets/extensions.md ]] && debug "cleanup previous extensions list" && >$bkp_brackets/extensions.md
	# list all extensions
	debug "list all enabled extensions" && ls "$src_brackets"/extensions/user >>$bkp_brackets/extensions.md
fi

unset bkp_brackets && unset src_brackets
print_heading "syncing brackets completed ..."
