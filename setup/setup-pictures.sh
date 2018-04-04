#!/bin/bash

print_heading "setting up pictures started"

# check pictures directory exists and then take a backup
if [ -d $projdir/copyfiles/pictures ]; then
	echo "copying pictures ....."
	\cp -v $projdir/copyfiles/pictures/* ~/Pictures/
fi

print_heading "setting up pictures completed"
