#!/bin/bash

print_heading "setting up terminal started ..."
bkp_terminal=$projdir/copyfiles/terminal/com.apple.Terminal.plist

# check whether directory exists and then copy its contents
[[ -e $bkp_terminal ]] && debug "setting terminal preferences" && \cp $bkp_terminal ~/Library/Preferences/
info "Note that these changes require a logout/restart of your OS to take effect"

unset bkp_terminal
print_heading "setting up terminal completed ..."
