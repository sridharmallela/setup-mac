#!/bin/bash

print_heading "syncing js settings started ..."
bkp_js=$projdir/dotfiles/js/

# check git config exists and then take a backup
if [ -e ~/.npmrc ]; then
	debug "copy bowerrc from $bkp_js" && \cp ~/.bowerrc $bkp_js/
	debug "copy editorconfig from $bkp_js" && \cp ~/.editorconfig $bkp_js/
	debug "copy eslintignore from $bkp_js" && \cp ~/.eslintignore $bkp_js/
	debug "copy eslintrc from $bkp_js" && \cp ~/.eslintrc $bkp_js/
	debug "copy jsbeautifyrc from $bkp_js" && \cp ~/.jsbeautifyrc $bkp_js/
	debug "copy npmrc from $bkp_js" && \cp ~/.npmrc $bkp_js/
	debug "copy tsconfig.json from $bkp_js" && \cp ~/tsconfig.json $bkp_js/
	debug "copy tslint.json from $bkp_js" && \cp ~/tslint.json $bkp_js/
fi

unset bkp_js
print_heading "syncing js settings completed ..."
