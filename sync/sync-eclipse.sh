#!/bin/bash

print_heading "syncing eclipse settings started ..."
bkp_eclipse=$projdir/copyfiles/eclipse

# check if file exists already, to copy it, copy eclipse ini config file
[[ -e "$ECLIPSE_HOME"/eclipse.ini ]] && debug "copy eclipse.ini from $ECLIPSE_HOME" && \cp "$ECLIPSE_HOME"/eclipse.ini $bkp_eclipse/

unset bkp_eclipse
print_heading "syncing eclipse settings completed ..."
