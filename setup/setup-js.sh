#!/bin/bash

print_heading "setting up js settings started ..."
bkp_js=$projdir/dotfiles/js

# check whether directory exists and then copy its contents
if [ -d $bkp_js ]; then
	debug "copy all js config files" && \cp $bkp_js/.bowerrc ~/ && \cp $bkp_js/.editorconfig ~/ && \cp $bkp_js/.eslintignore ~/ && \cp $bkp_js/.eslintrc ~/ && \cp $bkp_js/.jsbeautifyrc ~/ && \cp $bkp_js/tsconfig.json ~/ && \cp $bkp_js/tslint.json ~/
fi
# check to install npm modules
if ! test $(which npm); then
	debug "installing npm..." && brew install node n
fi
# node version# npm version
info "Node: $(node --version) NPM: $(npm --version)"
# setting up npmrc
debug "setting up npmrc"
npm config --global set strict-ssl false
npm config --global set progress false
npm config --global set loglevel silent
npm config --global set always-auth false
npm config --global set git-tag-version false
npm config --global set username smallela
npm config --global set email smallela.projworks@gmail.com
npm config --global set init-license UNLICENSED
npm config --global set init-version '0.0.1'
npm config --global set color always
npm config --global set package-lock false
npm config --global set maxsockets 250
npm config --global set editor 'code --wait'
npm config set strict-ssl false
npm config set progress false
npm config set loglevel silent
npm config set always-auth true
npm config set git-tag-version false
npm config set username smallela
npm config set email smallela.projworks@gmail.com
npm config set init-license UNLICENSED
npm config set init-version '0.0.1'
npm config set color always
npm config set package-lock false
npm config set maxsockets 250
npm config set editor 'code --wait'
# logout before login
# debug "npm logout always before login -- " && npm logout -d
# logout before login
# debug "npm login -- " && npm login -d
# install global modules
debug "installing global modules" && npm install -d -g @angular/cli bower eslint grunt gulp node-gyp npm sails tslint typescript webpack yarn

# unset variables
unset bkp_js
print_heading "setting up js settings completed ..."
