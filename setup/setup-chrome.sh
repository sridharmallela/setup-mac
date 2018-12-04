#!/bin/bash

print_heading "setting up chrome started ..."
bkp_chrome=$projdir/copyfiles/chrome/bookmarks.json && dest_chrome=~/Library/Application\ Support/Google/Chrome/Default

# check if file exists already, to copy it
[[ -e $bkp_chrome ]] && [[ -d $dest_chrome ]] && debug "copy raw json bookmarks from $bkp_chrome to $dest_chrome" && \cp $bkp_chrome "$dest_chrome"/ && debug "rename bookmarks.json to Bookmarks" && \mv "$dest_chrome"/bookmarks.json "$dest_chrome"/Bookmarks

unset bkp_chrome && unset dest_chrome
print_heading "setting up chrome completed ..."
