#!/bin/bash

print_heading "setting up terminal started"

# check whether directory exists and then copy its contents
if [ -e $projdir/copyfiles/terminal/com.apple.Terminal.plist ]; then
	echo "setting terminal ...."
	\cp -v $projdir/copyfiles/terminal/com.apple.Terminal.plist ~/Library/Preferences/
fi

print_heading "setting up terminal completed"
