#!/bin/bash

print_heading "setting up eclipse started"

# check if file exists already, to copy it
if [ -e $projdir/copyfiles/eclipse/eclipse.ini ]; then
	echo "copy eclipse.ini ....."
	## copy eclipse ini config file
	\cp -v $projdir/copyfiles/eclipse/eclipse.ini "$ECLIPSE_HOME"
fi

print_heading "setting up eclipse completed"
