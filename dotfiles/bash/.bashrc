#!/bin/bash
#  -------------------------------------------------------------------------------------------------------------
# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
#
#  Description:  This file holds all my BASH configurations and aliases
#
#  Sections:
#  1.   Environment Configuration
#  2.   Make Terminal Better (remapping defaults and adding functionality)
#  3.   Searching
#  4.   Process Management
#  5.   Networking
#  6.   System Operations & Information
#  7.   Development
#  8.   Setup End
#
#  Generously contributed by Sridhar Mallela
#  -------------------------------------------------------------------------------------------------------------

#   Use Figlet to print Welcome COMMAND
#  -------------------------------------------------------------------------------------------------------------
figlet -w 120 -f slant 'Welcome Sridhar Mallela' | boxes -d stark1 -pa2t0b0 -s 120x7

#  -------------------------------------------------------------------------------------------------------------
#   1.  ENVIRONMENT CONFIGURATION
#  -------------------------------------------------------------------------------------------------------------

#   check for interactive
case $- in
*i*) ;;
*) return ;;
esac

#   append to the history file, don't overwrite it
shopt -s histappend

#   Set default HTTP and HTTPS proxy
#  -------------------------------------------------------------------------------------------------------------

#   Set Defaults (no need to export as they will be set for current instance)
#  -------------------------------------------------------------------------------------------------------------
#   for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
#   Increase Bash history size. Allow 32³ entries; the default is 500.
HISTSIZE='32768'
HISTFILESIZE='32768'
#   don't put duplicate lines or lines starting with space in the history.
#   See bash(1) for more options
#   Omit duplicates and commands that begin with a space from history.
HISTCONTROL=ignoreboth
#   Prefer US English and use UTF-8.
LC_ALL='en_US.UTF-8'
LANG='en_US.UTF-8'
#   Set default blocksize for ls, df, du
BLOCKSIZE=1k
#   Enable persistent REPL history for `node`.
NODE_REPL_HISTORY_FILE=~/.node_history
#   Allow 32³ entries; the default is 1000.
NODE_REPL_HISTORY_SIZE='32768'
#   Always enable colored `grep` output.
GREP_OPTIONS='--color=auto'
#   Don’t clear the screen after quitting a manual page.
MANPAGER='less -X'

#   Setup some environment variables.
#  -------------------------------------------------------------------------------------------------------------
export NODE_ENV=development
export PORT=9605
export JAVA_HOME='/Library/Java/JavaVirtualMachines/jdk1.8.0_161.jdk/Contents/Home'
export JAVA_OPTS='-Dfile.encoding=UTF-8 -Dcatalina.base="/usr/local/opt/tomcat@7/libexec" -Dcatalina.home="/usr/local/opt/tomcat@7/libexec" -Djava.util.logging.config.file="/usr/local/opt/tomcat@7/libexec/conf/logging.properties" -Djava.util.logging.manager=org.apache.juli.ClassLoaderLogManager'
export JAVA_TOOL_OPTIONS='-Dfile.encoding=UTF8'
export M3_HOME='/usr/local/Cellar/maven/3.5.3'
export MAVEN_OPTS='-Xms256m -Xmx1024m -XX:MaxPermSize=256m -Dorg.slf4j.simpleLogger.defaultLogLevel=info'
export MAVEN_CMD_LINE_ARGS='-P dev compile'
export ANT_HOME='/usr/local/bin/ant'
export ANT_OPTS='-Xdebug -Xrunjdwp:server=y,transport=dt_socket,address=4000,suspend=n'
export ECLIPSE_HOME='/Applications/Eclipse JEE.app/Contents/Eclipse'
export GIT_MERGE_AUTOEDIT=no
#   bash to color for some other commands, such as ls
export CLICOLOR=1

#   Set Default Editor (change 'Nano' to the editor of your choice)
#  -------------------------------------------------------------------------------------------------------------
export EDITOR="brackets --wait"
#   EDITOR="atom --wait" for atom

#  -------------------------------------------------------------------------------------------------------------
#   2.  MAKE TERMINAL BETTER
#  -------------------------------------------------------------------------------------------------------------

#   Automatic setting of $DISPLAY (if not set already).
#   This works for me - your mileage may vary. . . .
#   The problem is that different types of terminals give different answers to 'who am i'
#   (rxvt in particular can be troublesome) - however this code seems to work in a majority
#   of cases.
if [ -z ${DISPLAY:=""} ]; then
	export DISPLAY=':0.0"'
fi

#   Source .bash_prompt if it exists
if [ -r ~/.bash_prompt ]; then
	source ~/.bash_prompt
fi

#   Alias definitions.
#   You may want to put all your additions into a separate file like
#   ~/.bash_aliases, instead of adding them here directly.
#   See /usr/share/doc/bash-doc/examples in the bash-doc package.
if [ -f ~/.bash_aliases ]; then
	source ~/.bash_aliases
fi

#   GIT Global Config
#  -------------------------------------------------------------------------------------------------------------
#   git config --global alias.lg 'log --color --graph --pretty=format:"%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset" --abbrev-commit'
#   git config --global apply.whitespace 'fix'
#   git config --global credential.helper osxkeychain
#   git config --global core.attributesfile '~/.gitattributes'
#   git config --global core.autocrlf input
#   git config --global core.compression 9
#   git config --global core.editor 'brackets --wait'
#   git config --global core.excludesfile '~/.gitignore_global'
#   git config --global core.fileMode true
#   git config --global core.pager 'less -FRSX'
#   git config --global core.trustctime false
#   git config --global core.untrackedcache true
#   git config --global core.whitespace 'space-before-tab,-indent-with-non-tab,trailing-space'
#   git config --global color.ui true
#   git config --global color.branch true
#   git config --global color.'branch'.current 'yellow reverse'
#   git config --global color.'branch'.local yellow
#   git config --global color.'branch'.remote green
#   git config --global color.diff true
#   git config --global color.'diff'.meta 'yellow bold'
#   git config --global color.'diff'.frag 'magenta bold'
#   git config --global color.'diff'.old 'red bold'
#   git config --global color.'diff'.new 'green bold'
#   git config --global color.interactive true
#   git config --global color.pager true
#   git config --global color.status true
#   git config --global color.'status'.added yellow
#   git config --global color.'status'.changed green
#   git config --global color.'status'.untracked red
#   git config --global diff.mnemonicprefix true
#   git config --global diff.renames copies
#   git config --global diff.tool meld
#   git config --global fetch.prune true
#   git config --global format.pretty oneline
#   git config --global grep.extendedregexp true
#   git config --global grep.linenumber true
#   git config --global merge.tool meld
#   git config --global merge.log true
#   git config --global merge.ff false
#   git config --global push.default simple
#   git config --global url.'https://'.insteadOf git://

#   Node Package Manager
#  -------------------------------------------------------------------------------------------------------------
#    npm config set strict-ssl false
#    npm config set progress false
#    npm config set loglevel silent
#    npm config set always-auth true
#    npm config set git-tag-version false
#    npm config set init-author-name Sridhar Mallela
#    npm config set init-license UNLICENSED
#    npm config set init-version '0.0.1'
#    npm config set color always
#    npm config set package-lock false
#    npm config set maxsockets 250

#  -------------------------------------------------------------------------------------------------------------
#   8.  SETUP END
#  -------------------------------------------------------------------------------------------------------------

#   Use Figlet to print Welcome COMMAND
#  -------------------------------------------------------------------------------------------------------------
echo -e '\nFollowing action are being setup \n\t==> ENVIRONMENT CONFIGURATION\n\t==> MAKE TERMINAL BETTER\n\t==> SEARCHING\n\t==> PROCESS MANAGEMENT\n\t==> NETWORKING\n\t==> SYSTEMS OPERATIONS & INFORMATION\n\t==> DEVELOPMENT\n\nBefore Software can be reusable, it first has to be usable' | boxes -d scroll -s 120x15

figlet -w 120 -f slant 'Happy Coding Sridhar!!' | boxes -d whirly -pa2t0b0 -s 120x7
