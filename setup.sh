#!/bin/bash

# basic function print title
function print_heading() {
	echo "------------------------------"
	echo $1
	echo "------------------------------"
	echo ""
}

# sync data from my computer
function setup_computer() {
	projdir=$(dirname "${BASH_SOURCE[0]}")
	echo "ask for sudo admin password"
	# ask for the administrator password upfront.
	sudo -v
	# keep-alive: update existing `sudo` time stamp until the script has finished.
	while true; do
		sudo -n true
		sleep 60
		kill -0 "$$" || exit
	done 2>/dev/null &
	# run sections based on command line arguments
	for ARG in "$@"; do
		# terminal setup
		if [ $ARG == "terminal" ] || [ $ARG == "all" ]; then
			# run the setup-terminal.sh Script
			source $projdir/setup/setup-terminal.sh
		fi
		# scripts setup
		if [ $ARG == "scripts" ] || [ $ARG == "all" ]; then
			# run the setup-scripts.sh Script
			source $projdir/setup/setup-scripts.sh
		fi
		# pictures setup
		if [ $ARG == "pictures" ] || [ $ARG == "all" ]; then
			# run the setup-pictures.sh Script
			source $projdir/setup/setup-pictures.sh
		fi
		# brew setup
		if [ $ARG == "brew" ] || [ $ARG == "all" ]; then
			# run the setup-brew.sh Script
			source $projdir/setup/setup-brew.sh
		fi
		# bash setup
		if [ $ARG == "bash" ] || [ $ARG == "all" ]; then
			# run the setup-bash.sh Script
			source $projdir/setup/setup-bash.sh
		fi
		# eclipse setup
		if [ $ARG == "eclipse" ] || [ $ARG == "all" ]; then
			# run the setup-eclipse.sh Script
			source $projdir/setup/setup-eclipse.sh
		fi
		# vscode setup
		if [ $ARG == "vscode" ] || [ $ARG == "all" ]; then
			# run the setup-vscode.sh Script
			source $projdir/setup/setup-vscode.sh
		fi
		# git setup
		if [ $ARG == "git" ] || [ $ARG == "all" ]; then
			# run the setup-git.sh Script
			source $projdir/setup/setup-git.sh
		fi
		# js setup
		if [ $ARG == "js" ] || [ $ARG == "all" ]; then
			# run the setup-js.sh Script
			source $projdir/setup/setup-js.sh
		fi
		# iOS setup
		if [ $ARG == "ios" ] || [ $ARG == "all" ]; then
			# run the setup-ios.sh Script
			source $projdir/setup/setup-iOS.sh
		fi
	done
	echo ""
	echo "manually setup following...... \n\t1. Postman Collections \n\t2. Eclipse Preferences"
	echo "\t3. Chrome Extensions \n\t4. iOS developer profile \n\t5. Any Others"
	echo ""
	unset projdir
}

setup_computer $@

# unset all functions
unset print_heading
unset setup_computer
