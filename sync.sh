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

# git lazy stuff
function lazy_git() {
	# sleep for 60 secs, before pushing
	debug "sleeping for 60 secs" && sleep 15s
	if output=$(git status --porcelain) && [ ! -z "$output" ]; then
		# change permissions if any files being created
		excho && debug "changing permissions for all files" && \chmod -R 755 $projdir/copyfiles/ $projdir/dotfiles/ $projdir/important/ $bkp_sync/ $projdir/setup/
		separator && info "starting git auto push" && git status -s && git add -A && git commit -am "chore(sync): automatic sync 🔥 changes at [$(date '+%m/%d/%Y %H:%M:%S')] for 💻 [$(hostname -f)]" && git push && info "completed git auto push" && separator
	fi
	unset output
}
# sync data from my computer
function sync_from_my_computer() {
	header && log "Started sync at $(date '+%m/%d/%Y %H:%M:%S')\n" && sys_meta
	projdir=$(dirname "${BASH_SOURCE[0]}")
	# change projdir to current directory in case of .
	[[ $projdir == "." ]] && projdir=$(pwd) && debug "setting up project directory $projdir"
	# assign sync variable
	is_sync=false && bkp_sync=$projdir/sync
	# run sections based on command line arguments
	for ARG in "$@"; do
		[ $ARG == "all" ] && is_sync=true
		# sync bash -- run the sync-bash.sh Script
		[[ $ARG == "bash" || $ARG == "all" ]] && source $bkp_sync/sync-bash.sh
		# sync brackets -- run the sync-brackets.sh Script
		[[ $ARG == "brackets" || $ARG == "all" ]] && source $bkp_sync/sync-brackets.sh
		# sync brew -- run the sync-brew.sh Script
		[[ $ARG == "brew" || $ARG == "all" ]] && source $bkp_sync/sync-brew.sh
		# sync chrome -- run the sync-chrome.sh Script
		[[ $ARG == "chrome" || $ARG == "all" ]] && source $bkp_sync/sync-chrome.sh
		# sync eclipse -- run the sync-eclipse.sh Script
		[[ $ARG == "eclipse" || $ARG == "all" ]] && source $bkp_sync/sync-eclipse.sh
		# sync git -- run the sync-git.sh Script
		[[ $ARG == "git" || $ARG == "all" ]] && source $bkp_sync/sync-git.sh
		# sync important -- run the sync-important.sh Script
		[[ $ARG == "important" || $ARG == "all" ]] && source $bkp_sync/sync-important.sh
		# sync js -- run the sync-js.sh Script
		[[ $ARG == "js" || $ARG == "all" ]] && source $bkp_sync/sync-js.sh
		# sync maven -- run the sync-maven.sh Script
		[[ $ARG == "maven" || $ARG == "all" ]] && source $bkp_sync/sync-maven.sh
		# sync notes -- run the sync-notes.sh Script
		[[ $ARG == "notes" || $ARG == "all" ]] && source $bkp_sync/sync-notes.sh
		# sync soap -- run the sync-soap.sh Script
		[[ $ARG == "soap" || $ARG == "all" ]] && source $bkp_sync/sync-soap.sh
		# sync scripts -- run the sync-scripts.sh Script
		[[ $ARG == "scripts" || $ARG == "all" ]] && source $bkp_sync/sync-scripts.sh
		# sync ssh -- run the sync-ssh.sh Script
		[[ $ARG == "ssh" || $ARG == "all" ]] && source $bkp_sync/sync-ssh.sh
		# sync terminal -- run the sync-terminal.sh Script
		[[ $ARG == "terminal" || $ARG == "all" ]] && source $bkp_sync/sync-terminal.sh
		# sync vscode -- run the sync-vscode.sh Script
		[[ $ARG == "vscode" || $ARG == "all" ]] && source $bkp_sync/sync-vscode.sh
	done
	[[ "$is_sync" == true ]] && cd $projdir && lazy_git && cd $mydir
	printf "[$(date '+%m/%d/%Y %H:%M:%S') INFO] manually sync following, \n\t1. Postman Collections \n\t2. Eclipse Preferences \n\t3. Chrome Extensions \n\t4. iOS developer profile \n\t5. SFTP Server Configuration \n\t6. Any Others"
	excho && separator && log "\nEnded sync at $(date '+%m/%d/%Y %H:%M:%S')" && header
}
# sync information from computer
sync_from_my_computer $@
# unset all functions
unset is_sync
unset mydir
unset bkp_sync
unset projdir
unset print_heading
unset debug
unset info
unset excho
unset separator
unset header
unset log
unset sys_meta
unset sync_from_my_computer
unset lazy_git
