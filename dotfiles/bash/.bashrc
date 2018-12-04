#!/bin/bash
# -------------------------------------------------------------------------------------------------------------
# ~/.bashrc: executed by bash(1) for non-login shells. see /usr/share/doc/bash/examples/startup-files
# Sections:
#     1. Environment Configuration
#     2. Make Terminal Better (remapping defaults and adding functionality)
#     3. Searching
#     4. Process Management
#     5. Networking
#     6. System Operations & Information
#     7. Development
#     8. Setup End
# Generously contributed by Sridhar Mallela
# -------------------------------------------------------------------------------------------------------------
# Use Figlet to print Welcome COMMAND
# figlet -w 120 -f slant 'Welcome Sridhar Mallela' | boxes -d stark1 -pa2t0b0 -s 120x7
# check for interactive
case $- in
*i*) ;;
*) return ;;
esac
# append to the history file, don't overwrite it
shopt -s histappend
# for setting history length see HISTSIZE and HISTFILESIZE in bash(1), Increase Bash history size. the default is 500.
HISTSIZE='32768'
HISTFILESIZE='32768'
# don't put duplicate lines or lines starting with space in the history.
# Omit duplicates and commands that begin with a space from history.
HISTCONTROL=ignoreboth
# Prefer US English and use UTF-8.
LC_ALL='en_US.UTF-8'
LANG='en_US.UTF-8'
# Set default blocksize for ls, df, du
BLOCKSIZE=1k
# Enable persistent REPL history for `node`.
NODE_REPL_HISTORY_FILE=~/.node_history
# Allow 32³ entries; the default is 1000.
NODE_REPL_HISTORY_SIZE='32768'
# Always enable colored `grep` output.
GREP_OPTIONS='--color=auto'
# Don’t clear the screen after quitting a manual page.
MANPAGER='less -X'
# Setup environment variables.
export NODE_ENV=development
export PORT=9605
export APP_HOST=$(hostname)
export HOST=$(hostname)
export ANT_HOST_NAME=$(hostname)
export ANT_HOME='/usr/local/bin/ant'
export ANT_OPTS='-Xdebug -Xrunjdwp:server=y,transport=dt_socket,address=4000,suspend=n'
export JAVA_HOME=$(/usr/libexec/java_home -v 1.8)
export JAVA_OPTS='-Dfile.encoding=UTF-8 -Djava.net.useSystemProxies=true -Dhttp.proxySet=true -Dcatalina.base="/usr/local/opt/tomcat@7/libexec" -Dcatalina.home="/usr/local/opt/tomcat@7/libexec" -Djava.util.logging.config.file="/usr/local/opt/tomcat@7/libexec/conf/logging.properties" -Djava.util.logging.manager=org.apache.juli.ClassLoaderLogManager'
export JAVA_TOOL_OPTIONS='-Dfile.encoding=UTF8'
# maven updates might change version
export M3_HOME='/usr/local/Cellar/maven/3.6.0'
export MAVEN_OPTS='-Xms256m -Xmx1024m -XX:PermSize=256m -noverify -Dorg.slf4j.simpleLogger.defaultLogLevel=info'
export MAVEN_CMD_LINE_ARGS='-P dev compile'
export ECLIPSE_HOME='/Applications/Eclipse JEE.app/Contents/MacOS/'
export GIT_MERGE_AUTOEDIT=yes
export ADOBE_AIR_HOME='/usr/local/share/adobe-air-sdk'
# bash to color for some other commands, such as ls
export CLICOLOR=1
export SONAR_SCANNER_HOME='/usr/local/Cellar/sonar-scanner/'
export SONAR_SCANNER_OPTS='-Xmx512m'
export NODE_NO_WARNINGS=1
# Set Default Editor (change 'Nano' to the editor of your choice)
# export EDITOR='/Applications/Brackets.app/Contents/MacOS/Brackets --wait'# for brackets
# export EDITOR='subl --wait' # for sublime text
# export EDITOR='atom --wait' # for atom
export EDITOR='/Applications/Brackets.app/Contents/MacOS/Brackets --wait'
# Automatic setting of $DISPLAY (if not set already). The problem is that different types of terminals give different
# answers to 'who am i' however this code seems to work in a majority of cases.
if [ -z ${DISPLAY:=''} ]; then
	export DISPLAY=':0.0"'
fi
# Source .bash_prompt if it exists
if [ -r ~/.bash_prompt ]; then
	source ~/.bash_prompt
fi
# Alias definitions. You may want to put all your additions into a separate file like ~/.bash_aliases, instead of
# adding them here directly. See /usr/share/doc/bash-doc/examples in the bash-doc package.
if [ -f ~/.bash_aliases ]; then
	source ~/.bash_aliases
fi
# Use Figlet to print Welcome COMMAND
echo -e '\nFollowing action are being setup \n\t==> ENVIRONMENT CONFIGURATION\n\t==> MAKE TERMINAL BETTER\n\t==> SEARCHING\n\t==> PROCESS MANAGEMENT\n\t==> NETWORKING\n\t==> SYSTEMS OPERATIONS & INFORMATION\n\t==> DEVELOPMENT\n\nBefore Software can be reusable, it first has to be usable' | boxes -d scroll -s 120x15
figlet -w 120 -f slant 'Happy Coding Sridhar!!' | boxes -d whirly -pa2t0b0 -s 120x7
