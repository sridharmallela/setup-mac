#!/bin/bash
#  -------------------------------------------------------------------------------------------------------------
#   see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
#   for examples
#   You may want to put all your additions into a separate file like
#   ~/.bash_aliases, instead of adding them here directly.
#   See /usr/share/doc/bash-doc/examples in the bash-doc package.

#  -------------------------------------------------------------------------------------------------------------
#   2.  MAKE TERMINAL BETTER
#  -------------------------------------------------------------------------------------------------------------

#   Set defaults for UNIX
#  -------------------------------------------------------------------------------------------------------------
#   enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
	test -r ~/.dircolors && eval '$(dircolors -b ~/.dircolors)' || eval '$(dircolors -b)'
	alias ls='ls --color=always --group-directories-first'
	alias grep='grep --color=always -n'
	alias fgrep='fgrep --color=always -n'
	alias egrep='egrep --color=always -n'
fi

alias less='less --RAW-CONTROL-CHARS'     # Less with raw control chars
alias cp='cp -iv'                         # Preferred 'cp' implementation
alias mv='mv -iv'                         # Preferred 'mv' implementation
alias rm='rm -iv'                         # Preferred 'rm' implementation
alias mkdir='mkdir -pv'                   # Preferred 'mkdir' implementation
alias lsd='ls -FGlAhp | grep "^d"'        # Preferred 'ls' implementation (only directories)
alias f='open -a Finder ./'               # f:            Opens current directory in MacOS Finder
alias type='type -all'                    # which:        Find executables
alias path='echo -e ${PATH//:/\\n}'       # path:         Echo all executable Paths
alias show_options='shopt'                # Show_options: display bash options settings
alias cic='set completion-ignore-case On' # cic:          Make tab-completion case-insensitive
# Always list directory contents upon 'cd'
cd() {
	builtin cd "$@"
	ls -latr
}

#   Set default for BREW
#  -------------------------------------------------------------------------------------------------------------
alias brewall='brew outdated && brew update && brew upgrade && brew cleanup && brew doctor && brew cask outdated && brew cask upgrade && brew cask cleanup && brew cask doctor'

#   lr:  Full Recursive Directory Listing
#  -------------------------------------------------------------------------------------------------------------
alias lr='ls -R | grep ":$" | sed -e '\''s/:$//'\'' -e '\''s/[^-][^\/]*\//--/g'\'' -e '\''s/^/   /'\'' -e '\''s/-/|/'\'' | less'

#   showa: to remind yourself of an alias (given some part of it)
#  -------------------------------------------------------------------------------------------------------------
showa() { /usr/bin/grep --color=always -i -a1 $@ ~/.bash_aliases | grep -v '^\s*$' | less -FSRXc; }

#   Set defaults for TCP PORTS
#  -------------------------------------------------------------------------------------------------------------
alias myports='lsof -iTCP -sTCP:LISTEN -n -P'                           # List all open TCP Ports
alias reload='source ~/.bash_profile'                                   # Reload the bash_profile
alias pwdfailed='syslog -k Time ge -24h | egrep -e "sshd|ftpd|afp|vnc"' # Password Failed Log

#  -------------------------------------------------------------------------------------------------------------
#   3.  SEARCHING
#  -------------------------------------------------------------------------------------------------------------

#   Set defaults for Searching
#  -------------------------------------------------------------------------------------------------------------
alias qfind="find . -name "              # qfind:    Quickly search for file
ff() { /usr/bin/find . -name "$@"; }     # ff:       Find file under the current directory
ffs() { /usr/bin/find . -name "$@"'*'; } # ffs:      Find file whose name starts with a given string
ffe() { /usr/bin/find . -name '*'"$@"; } # ffe:      Find file whose name ends with a given string

#   delete history from vscode
#  -------------------------------------------------------------------------------------------------------------
alias ffhist="find ~/git -name .history -and -type d -prune"
alias delhist="find ~/git -name .history -and -type d -prune -exec rm -rf {} \;"

#  -------------------------------------------------------------------------------------------------------------
#   4.  PROCESS MANAGEMENT
#  -------------------------------------------------------------------------------------------------------------

#   findPid: find out the pid of a specified process
#  -------------------------------------------------------------------------------------------------------------
#       Note that the command name can be specified via a regex
#       E.g. findPid '/d$/' finds pids of all processes with names ending in 'd'
#       Without the 'sudo' it will only find processes of the current user
#  -------------------------------------------------------------------------------------------------------------
findPid() { lsof -t -c "$@"; }

#   memHogsTop, memHogsPs:  Find memory hogs
#  -------------------------------------------------------------------------------------------------------------
alias memHogsTop='top -l 1 -o rsize | head -20'
alias memHogsPs='ps wwaxm -o pid,stat,vsize,rss,time,command | head -10'

#   cpuHogs:  Find CPU hogs
#  -------------------------------------------------------------------------------------------------------------
alias cpu_hogs='ps wwaxr -o pid,stat,%cpu,time,command | head -10'

#   topForever:  Continual 'top' listing (every 10 seconds)
#  -------------------------------------------------------------------------------------------------------------
alias topForever='top -l 9999999 -s 10 -o cpu'

#   ttop:  Recommended 'top' invocation to minimize resources
#  -------------------------------------------------------------------------------------------------------------
#       Taken from this macosxhints article
#       http://www.macosxhints.com/article.php?story=20060816123853639
#  -------------------------------------------------------------------------------------------------------------
alias ttop="top -R -F -s 10 -o rsize"

#   my_ps: List processes owned by my user:
#  -------------------------------------------------------------------------------------------------------------
my_ps() { ps $@ -u $USER -o pid,%cpu,%mem,start,time,bsdtime,command; }

#   camera assistant
#  -------------------------------------------------------------------------------------------------------------
#    alias killvideo='sudo killall VDCAssistant'
#    alias killcam='sudo killall AppleCameraAssistant'
#    alias resetcam='killvideo && killcam'

#  -------------------------------------------------------------------------------------------------------------
#   5.  NETWORKING
#  -------------------------------------------------------------------------------------------------------------
alias netCons='lsof -i'                           # netCons:      Show all open TCP/IP sockets
alias flushDNS='dscacheutil -flushcache'          # flushDNS:     Flush out the DNS Cache
alias lsock='sudo /usr/sbin/lsof -i -P'           # lsock:        Display open sockets
alias lsockU='sudo /usr/sbin/lsof -nP | grep UDP' # lsockU:       Display only open UDP sockets
alias lsockT='sudo /usr/sbin/lsof -nP | grep TCP' # lsockT:       Display only open TCP sockets
alias ipInfo0='ipconfig getpacket en0'            # ipInfo0:      Get info on connections for en0
alias ipInfo1='ipconfig getpacket en1'            # ipInfo1:      Get info on connections for en1
alias openPorts='sudo lsof -i | grep LISTEN'      # openPorts:    All listening connections
alias showBlocked='sudo ipfw list'                # showBlocked:  All ipfw rules inc/ blocked IPs

#   getip:  display IP Address
#  -------------------------------------------------------------------------------------------------------------
getip() {
	/sbin/ifconfig | grep "inet " | grep -v 127.0.0.1 | cut -d\  -f2
}

#   ii:  display useful host related informaton
#  -------------------------------------------------------------------------------------------------------------
ii() {
	echo -e "\nYou are logged on ${RED}$HOST"
	echo -e "\nAdditionnal information:$NC "
	uname -a
	echo -e "\n${RED}Users logged on:$NC "
	w -h
	echo -e "\n${RED}Current date :$NC "
	date
	echo -e "\n${RED}Machine stats :$NC "
	uptime
	echo -e "\n${RED}Current network location :$NC "
	scselect
	#       echo -e "\n${RED}Public facing IP Address :$NC " ;myip
	#       echo -e "\n${RED}DNS Configuration:$NC " ; scutil --dns
	echo
}

#  -------------------------------------------------------------------------------------------------------------
#   6.  SYSTEMS OPERATIONS & INFORMATION
#  -------------------------------------------------------------------------------------------------------------
alias mountReadWrite='/sbin/mount -uw /' # mountReadWrite:   For use when booted into single-user
alias restartdock='killall Dock'         # Restart dock

#   cleanupDS:  Recursively delete .DS_Store files
#  -------------------------------------------------------------------------------------------------------------
alias cleanupDS="find . -type f -name '*.DS_Store' -ls -delete"

#   finderShowHidden:   Show hidden files in Finder
#   finderHideHidden:   Hide hidden files in Finder
#  -------------------------------------------------------------------------------------------------------------
alias finderShowHidden='defaults write com.apple.finder ShowAllFiles TRUE'
alias finderHideHidden='defaults write com.apple.finder ShowAllFiles FALSE'

#   cleanupLS:  Clean up LaunchServices to remove duplicates in the "Open With" menu
#  -------------------------------------------------------------------------------------------------------------
alias cleanupLS="/System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support/lsregister -kill -r -domain local -domain system -domain user && killall Finder"

#    screensaverDesktop: Run a screensaver on the Desktop
#  -------------------------------------------------------------------------------------------------------------
alias screensaverDesktop='/System/Library/Frameworks/ScreenSaver.framework/Resources/ScreenSaverEngine.app/Contents/MacOS/ScreenSaverEngine -background'

#   echo kern.maxfiles=65536 | sudo tee -a /etc/sysctl.conf
#   echo kern.maxfilesperproc=65536 | sudo tee -a /etc/sysctl.conf
#   sudo sysctl -w kern.maxfiles=65536
#   sudo sysctl -w kern.maxfilesperproc=65536
#   ulimit -n 65536 65536

#  -------------------------------------------------------------------------------------------------------------
#   7.  DEVELOPMENT
#  -------------------------------------------------------------------------------------------------------------

#   Maven
#  -------------------------------------------------------------------------------------------------------------
alias mvnc='mvn clean -U'
alias mvnp='mvnc package -U'
alias mvni='mvnc install -U'
alias mvne='mvn eclipse:eclipse -U'
alias mvnec='mvn eclipse:clean -U'
alias mvnpd='mvnp -DskipTests'
alias mvnid='mvni -DskipTests'

#   GIT Aliases
#  -------------------------------------------------------------------------------------------------------------
alias gits='git status -s'
alias gitp='git pull'
alias gitcd='git checkout develop'
alias gitcm='git checkout master'
alias gitpd='gitp origin develop'
alias gitpm='gitp origin master'
alias gitr='git reset --hard origin'
alias gitpr='git remote prune origin'
alias gita='git add -A'
alias pull='git pull'
alias push='git push'
alias gitdl='git branch | grep -v "master"| grep -v "develop" | xargs git branch -D'
alias gitlog='git log --pretty=format:"%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset" --abbrev-commit'

#   SSH Aliases
#  -------------------------------------------------------------------------------------------------------------
alias brewco='sh ~/scripts/rm-node.sh'

#   Some other Aliases
#  -------------------------------------------------------------------------------------------------------------
alias version='npm --no-git-tag-version version'
