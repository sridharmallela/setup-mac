#!/bin/bash

print_heading "syncing stickie notes started ..."
bkp_notes=~/Library/StickiesDatabase

# check git config exists and then take a backup
[ -e $bkp_notes ] && debug "copy $(dirname $bkp_notes)/StickiesDatabase" && \cp $bkp_notes $projdir/copyfiles/notes/

print_heading "syncing stickie notes completed ..."
