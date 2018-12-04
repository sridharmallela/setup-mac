#!/bin/bash

print_heading "syncing terminal started ..."
bkp_terminal=~/Library/Preferences/com.apple.Terminal.plist

# check whether directory exists and then copy its contents
[[ -e $bkp_terminal ]] && debug "syncing terminal from $bkp_terminal" && \cp $bkp_terminal $projdir/copyfiles/terminal/

unset bkp_terminal
print_heading "syncing terminal completed ..."
