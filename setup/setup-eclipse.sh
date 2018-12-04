#!/bin/bash

print_heading "setting up eclipse started ..."
bkp_eclipse=$projdir/copyfiles/eclipse/eclipse.ini

## copy eclipse ini config file
[[ -e $bkp_eclipse ]] && debug "copy from $bkp_eclipse to $ECLIPSE_HOME ....." && \cp $bkp_eclipse "$ECLIPSE_HOME"

unset bkp_eclipse
print_heading "setting up eclipse completed ..."
