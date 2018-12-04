#!/bin/bash

# basic function print title
function print_heading() {
	separator && info $1 && separator && excho
}

# turn on debug by setting it to 0
function debug() {
	[[ ${LAPPY_SETUP_SYNC_DEBUG} -eq 0 ]] && log [$(date '+%m/%d/%Y %H:%M:%S') DEBUG] $*
}

# logs with timestamp
function info() {
	log [$(date '+%m/%d/%Y %H:%M:%S') INFO] $*
}

function excho() {
	log ""
}

# separator used in
function separator() {
	log "------------------------------------------------------------------------------------------------------"
}

# header to start with
function header() {
	log "######################################################################################################"
}

# basic echo or print
function log() {
	echo $*
}

function sys_meta() {
	separator && excho
	# echo $(system_profiler SPSoftwareDataType) # for complete info
	info $(system_profiler SPSoftwareDataType | grep "System Version")
	info $(system_profiler SPSoftwareDataType | grep "Boot Volume")
	info $(system_profiler SPSoftwareDataType | grep "Computer Name")
	info $(system_profiler SPSoftwareDataType | grep "User Name")
	info $(system_profiler SPSoftwareDataType | grep "Time since boot")
	separator && excho
}

# sync data from my computer
function setup_computer() {
	header && log "Started setup at $(date '+%m/%d/%Y %H:%M:%S')" && sys_meta
	# check for project directory
	projdir=$(dirname "${BASH_SOURCE[0]}")
	# change projdir to current directory in case of .
	[[ $projdir == "." ]] && projdir=$(pwd) && debug "setting up project directory $projdir"
	info "ask for administrator password"
	# ask for the administrator password upfront.
	sudo -v
	# keep-alive: update existing `sudo` time stamp until the script has finished.
	while true; do
		sudo -n true
		sleep 60
		kill -0 "$$" || exit
	done 2>/dev/null &
	bkp_setup=$projdir/setup && debug "setup project directory is $bkp_setup" && excho
	# run sections based on command line arguments
	for ARG in "$@"; do
		# important iOS --- run the setup-ios.sh Script
		[[ $ARG == "ios" || $ARG == "all" ]] && source $bkp_setup/setup-iOS.sh
		# important setup --- run the setup-important.sh Script
		[[ $ARG == "important" || $ARG == "all" ]] && source $bkp_setup/setup-important.sh
		# notes setup --- run the setup-notes.sh Script
		[[ $ARG == "notes" || $ARG == "all" ]] && source $bkp_setup/setup-notes.sh
		# pictures setup --- run the setup-pictures.sh Script
		[[ $ARG == "pictures" || $ARG == "all" ]] && source $bkp_setup/setup-pictures.sh
		# scripts setup --- run the setup-scripts.sh Script
		[[ $ARG == "scripts" || $ARG == "all" ]] && source $bkp_setup/setup-scripts.sh
		# ssh setup --- run the setup-ssh.sh Script
		[[ $ARG == "ssh" || $ARG == "all" ]] && source $bkp_setup/setup-ssh.sh
		# terminal setup --- run the setup-terminal.sh Script
		[[ $ARG == "terminal" || $ARG == "all" ]] && source $bkp_setup/setup-terminal.sh
		# bash setup --- run the setup-bash.sh Script
		[[ $ARG == "bash" || $ARG == "all" ]] && source $bkp_setup/setup-bash.sh
		# brew setup --- run the setup-brew.sh Script
		[[ $ARG == "brew" || $ARG == "all" ]] && source $bkp_setup/setup-brew.sh
		# entrust git --- run the setup-git.sh Script
		[[ $ARG == "git" || $ARG == "all" ]] && source $bkp_setup/setup-git.sh
		# brackets setup --- run the setup-brackets.sh Script
		[[ $ARG == "brackets" || $ARG == "all" ]] && source $bkp_setup/setup-brackets.sh
		# chrome setup --- run the setup-chrome.sh Script
		[[ $ARG == "chrome" || $ARG == "all" ]] && source $bkp_setup/setup-chrome.sh
		# eclipse setup --- run the setup-eclipse.sh Script
		[[ $ARG == "eclipse" || $ARG == "all" ]] && source $bkp_setup/setup-eclipse.sh
		# js setup --- run the setup-js.sh Script
		[[ $ARG == "js" || $ARG == "all" ]] && source $bkp_setup/setup-js.sh
		# maven setup --- run the setup-maven.sh Script
		[[ $ARG == "maven" || $ARG == "all" ]] && source $bkp_setup/setup-maven.sh
		# soap setup --- run the setup-soap.sh Script
		[[ $ARG == "soap" || $ARG == "all" ]] && source $bkp_setup/setup-soap.sh
		# vscode setup --- run the setup-vscode.sh Script
		[[ $ARG == "vscode" || $ARG == "all" ]] && source $bkp_setup/setup-vscode.sh
		# apps setup --- run the setup-apps.sh Script
		[[ $ARG == "apps" ]] && source $bkp_setup/setup-apps.sh
	done
	# using printf to have \n or \t picked
	separator
	printf "[$(date '+%m/%d/%Y %H:%M:%S') INFO] manually setup following, \n\t1. Postman Collections \n\t2. Eclipse Preferences\n\t3. Chrome Extensions \n\t4. iOS developer profile \n\t5. SFTP Server Configuration \n\t6. Any Others "
	excho && separator && log "Ended setup at $(date '+%m/%d/%Y %H:%M:%S')" && header
}
# execute setup commputer
setup_computer $@
# unset all functions and variables
unset projdir
unset bkp_setup
unset print_heading
unset debug
unset info
unset excho
unset separator
unset header
unset log
unset sys_meta
unset setup_computer
