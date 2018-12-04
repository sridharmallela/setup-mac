#!/bin/bash

print_heading "setting up maven settings started ..."
bkp_mvn=$projdir/dotfiles/maven

# check to install maven
if ! test $(which mvn); then
	debug "installing maven " && brew install java maven
fi
# check whether directory exists and then copy its contents
if [ -d $bkp_mvn ]; then
	debug "copy mavenrc from $bkp_mvn/.mavenrc to $(dirname ~/Documents)" && \cp $bkp_mvn/.mavenrc ~/
fi

unset bkp_mvn
print_heading "setting up maven settings completed ..."
