#!/bin/bash

print_heading "setting up bash files started"

# check whether directory exists and then copy its contents
if [ -d $projdir/dotfiles/bash ]; then
	echo "copy all bash files ....."
	\cp -v $projdir/dotfiles/bash/ ~/
fi

print_heading "setting up bash files completed"
