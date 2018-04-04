#!/bin/bash

print_heading "setting up shell scripts started"

# check whether scripts folder exists
if [ ! -d ~/scripts ]; then
	echo "creating important docs folders"
	\mkdir -v ~/scripts
fi

# check whether directory exists and then copy its contents
if [ -d $projdir/copyfiles/scripts ]; then
	echo "copy all shell scripts ....."
	\cp -v $projdir/copyfiles/scripts/* ~/scripts/
fi

print_heading "setting up shell scripts completed"
