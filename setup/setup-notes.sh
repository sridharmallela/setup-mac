#!/bin/bash

print_heading "setting up stickie notes started ..."
bkp_notes=$projdir/copyfiles/notes/StickiesDatabase

# check whether directory exists and then copy its contents
[[ -e $bkp_notes ]] && debug "copy stickie notes from $bkp_notes to $(dirname ~/Library/Mails)" && \cp $bkp_notes ~/Library/

unset bkp_notes
print_heading "setting up stickie notes completed ..."
