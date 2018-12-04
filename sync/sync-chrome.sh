#!/bin/bash

print_heading "syncing chrome settings started ..."
bkp_chrome=~/Library/Application\ Support/Google/Chrome/Default/Bookmarks

# check if file exists already, to copy it, copy raw json bookmarks from chrome
[[ -e "$bkp_chrome" ]] && debug "copy raw json bookmarks from $bkp_chrome" && \cp "$bkp_chrome" $projdir/copyfiles/chrome/bookmarks.json

unset bkp_chrome
print_heading "syncing chrome settings completed ..."
