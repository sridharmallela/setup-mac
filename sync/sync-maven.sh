#!/bin/bash

print_heading "syncing maven settings started ..."
bkp_mvn=$projdir/dotfiles/maven

# check settings xml exists and then take a backup
[[ -e ~/.m2/settings.xml ]] && debug "copy settings.xml from $(dirname ~/.m2/settings.xml)" && \cp ~/.m2/settings.xml $bkp_mvn/
# check mavenrc exists and then take a backup
debug "copy mavenrc from $(dirname ~/.m2)" && [[ -e ~/.mavenrc ]] && \cp ~/.mavenrc $bkp_mvn/

unset bkp_mvn
print_heading "syncing maven settings completed ..."
