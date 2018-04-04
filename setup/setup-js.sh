#!/bin/bash

print_heading "setting up js settings started"

# check whether directory exists and then copy its contents
if [ -d $projdir/dotfiles/js ]; then
	echo "copy all js config files ....."
	\cp -v $projdir/dotfiles/js/* ~/
	echo "remove global npm modules"
	\rm -v ~/.npmrc
fi

# check to install npm modules
if test ! $(which npm); then
	echo "installing npm..."
	brew install node n
fi

# node version
node --version
# npm version
npm --version

echo "setting up npmrc"
npm config set strict-ssl false
npm config set progress false
npm config set loglevel silent
npm config set always-auth true
npm config set git-tag-version false
npm config set username smallela
npm config set email sridharbanks@gmail.com
npm config set init-author-name Sridhar Mallela
npm config set init-author-email sridharbanks@gmail.com
npm config set init-license UNLICENSED
npm config set init-version '0.0.1'
npm config set color always
npm config set package-lock false
npm config set maxsockets 250
echo "npm login"
# logout before login
npm logout
npm login

echo "installing global modules"
npm install -g @angular/cli bower eslint grunt gulp node-gyp npm sails tslint typescript webpack yarn

print_heading "setting up js settings completed"
