#!/bin/bash

print_heading "setting up brackets started ..."
bkp_brackets=$projdir/copyfiles/brackets/brackets.json && dest_brackets=~/Library/Application\ Support/Brackets/

# check if brackets destination exists
[[ ! -d $dest_brackets ]] && debug "creating $dest_brackets" && \mkdir $dest_brackets
# check backup exists and copy content
[[ -d $dest_brackets ]] && [[ -e $bkp_brackets ]] && debug "copying from $bkp_brackets to $dest_brackets" && \cp $bkp_brackets "$dest_brackets"

unset bkp_brackets && unset src_brackets
print_heading "setting up brackets completed ..."
