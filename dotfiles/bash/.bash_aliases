#!/bin/bash
#  -------------------------------------------------------------------------------------------------------------
#   see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
#   for examples
#   You may want to put all your additions into a separate file like
#   ~/.bash_aliases, instead of adding them here directly.
#   See /usr/share/doc/bash-doc/examples in the bash-doc package.
#  -------------------------------------------------------------------------------------------------------------

# cd: Always list directory contents upon 'cd'
cd() { builtin cd $@ && ls; }
# showa: to remind yourself of an alias (given some part of it)
showa() { /usr/bin/grep --color=always -i -a1 $@ ~/.bash_aliases | grep -v '^\s*$' | less -FSRXc; }
# findPid: find out the pid of a specified process
findPid() { lsof -t -c $@; }
# Find file under the current directory
# ff() { /usr/bin/find . -name $@; }
# Find file whose name starts with a given string
# ffs() { /usr/bin/find . -name "$@"'*'; }
# Find file whose name ends with a given string
# ffe() { /usr/bin/find . -name '*'"$@"; }
# List processes owned by my user:
my_ps() { ps $@ -u $USER -o pid,%cpu,%mem,start,time,bsdtime,command; }
# display IP Address
getip() { /sbin/ifconfig | grep 'inet ' | grep -v 127.0.0.1 | cut -d\  -f2; }
# display useful host related informaton
# ii() {
#	 echo -e '\nYou are logged on ${RED}$HOST'
#	 echo -e '\nAdditionnal information:$NC '
#	 uname -a
#	 echo -e '\n${RED}Users logged on:$NC '
#	 w -h
#	 echo -e '\n${RED}Current date :$NC '
#	 date
#	 echo -e '\n${RED}Machine stats :$NC '
#	 uptime
#	 echo -e '\n${RED}Current network location :$NC '
#	 scselect
#	 echo
# }

# Preferred 'cp' implementation
alias cp='cp -iv'
# Preferred 'mv' implementation
alias mv='mv -iv'
# Preferred 'rm' implementation
alias rm='rm -iv'
# Preferred 'mkdir' implementation
alias mkdir='mkdir -pv'
# Find executables
alias type='type -all'
# Echo all executable Paths
alias path='echo -e ${PATH//:/\\n}'
# Preferred 'ls' implementation (only directories)
# alias lsd='ls -FGlAhp | grep "^d"'
# f: Opens current directory in MacOS Finder
# alias f='open -a Finder ./'
# Show_options: display bash options settings
# alias show_options='shopt'
# Make tab-completion case-insensitive
# alias cic='set completion-ignore-case On'
# lr:  Full Recursive Directory Listing
# alias lr='ls -R | grep ":$" | sed -e '\''s/:$//'\'' -e '\''s/[^-][^\/]*\//--/g'\'' -e '\''s/^/   /'\'' -e '\''s/-/|/'\'' | less'
# List all open TCP Ports
alias myports='lsof -iTCP -sTCP:LISTEN -n -P'
# Reload the bash_profile
alias reload='source ~/.bash_profile'
# Quickly search for file
alias qfind='find . -name '
# memHogsTop, memHogsPs: Find memory hogs
# alias memHogsTop='top -l 1 -o rsize | head -20'
# memHogsTop, memHogsPs: Find memory hogs
# alias memHogsPs='ps wwaxm -o pid,stat,vsize,rss,time,command | head -10'
# cpuHogs: Find CPU hogs
# alias cpu_hogs='ps wwaxr -o pid,stat,%cpu,time,command | head -10'
# Continual 'top' listing (every 10 seconds)
# alias topForever='top -l 9999999 -s 10 -o cpu'
# Recommended 'top' invocation to minimize resources
# alias ttop='top -R -F -s 10 -o rsize'
# NETWORKING
# Show all open TCP/IP sockets
alias netCons='lsof -i'
# Flush out the DNS Cache
alias flushDNS='dscacheutil -flushcache'
# Display open sockets
# alias lsock='sudo /usr/sbin/lsof -i -P'
# Display only open UDP sockets
# alias lsockU='sudo /usr/sbin/lsof -nP | grep UDP'
# Display only open TCP sockets
# alias lsockT='sudo /usr/sbin/lsof -nP | grep TCP'
# Get info on connections for en0
# alias ipInfo0='ipconfig getpacket en0'
# Get info on connections for en1
# alias ipInfo1='ipconfig getpacket en1'
# openPorts listening to all connections
# alias openPorts='sudo lsof -i | grep LISTEN'
# For use when booted into single-user
# alias mountReadWrite='/sbin/mount -uw /'
# Restart dock
alias restartdock='killall Dock'
# sort launchpad to alpha order
alias sortpad='defaults write com.apple.dock ResetLaunchPad -bool TRUE; killAll Dock;'
# sort by 5x7
alias sortpad6='defaults write com.apple.dock springboard-rows -int 5; defaults write com.apple.dock springboard-columns -int 7; defaults write com.apple.dock ResetLaunchPad -bool true; killall Dock'
# Recursively delete .DS_Store files
alias cleanupDS='find . -type f -name "*.DS_Store" -ls -delete'
# Clean up LaunchServices to remove duplicates in the 'Open With' menu
alias cleanupLS='/System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support/lsregister -kill -r -domain local -domain system -domain user && killall Finder'
# Run a screensaver on the Desktop
alias screensaverDesktop='/System/Library/Frameworks/ScreenSaver.framework/Resources/ScreenSaverEngine.app/Contents/MacOS/ScreenSaverEngine -background'
# Show hidden files in Finder
alias finderShowHidden='defaults write com.apple.finder ShowAllFiles TRUE'
# Hide hidden files in Finder
alias finderHideHidden='defaults write com.apple.finder ShowAllFiles FALSE'
# kill video camera assistant
alias killvideo='sudo killall VDCAssistant'
# kill apple camera assistant
alias killcam='sudo killall AppleCameraAssistant'
# reset camera by killing both camera
alias resetcam='killvideo && killcam'
# delete history from vscode
alias delhist='find ~/git -name .history -and -type d -prune -exec rm -rf {} \;'
# Script to SSH on to OLTX
alias OLTX='expect ~/scripts/oltx.sh'
# Script to SSH on to OSCR
alias OSCR='expect ~/scripts/oscr.sh'
# remove node unwanted libraries
alias brewco='sh ~/scripts/rm-node.sh'
# remove log files created by sync process
alias cleansync='>~/log/syncdata.log'
# check sync logs in live
alias synclogs='tail -100f ~/log/syncdata.log'
# for module cli to work
alias clexp='node ~/git/pr105639-module_cli/lib/cli.js'
# Set default for BREW
alias brewall='brew outdated && brew update && brew upgrade && brew doctor && brew cask outdated && brew cask upgrade && brew cleanup && brew cask doctor && sortpad'
# Maven - Clean Package
alias mvnpd='mvn clean package -U -DskipTests'
# Maven - Clean Install
alias mvnid='mvn clean install -U -DskipTests'
# GIT - status, pull, checkout merge \
alias gits='git status -s'
alias gitp='git pull --rebase'
alias gitcd='git checkout develop'
alias gitcm='git checkout master'
alias gitpd='git pull origin develop'
alias gitpm='git pull origin master'
alias gitr='git reset --hard origin'
alias gitpr='git remote prune origin'
alias gita='git add -A'
alias gitdl='git branch | grep -v "master"| grep -v "develop" | xargs git branch -D'
# alias gitlog='git log --pretty=format:"%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset" --abbrev-commit'
# Working Projects directories
