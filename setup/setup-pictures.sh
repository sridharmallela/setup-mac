#!/bin/bash

print_heading "setting up pictures started ..."
bkp_pics=$projdir/copyfiles/pictures

# check pictures directory exists and then take a backup
[[ -d $bkp_pics ]] && debug "copying pictures from $bkp_pics to $(dirname ~/Pictures)/Pictures" && \cp $bkp_pics/* ~/Pictures/

unset bkp_pics
print_heading "setting up pictures completed ..."
