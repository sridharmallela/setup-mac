echo $ECLIPSE_HOME

# capture current location
currDir=$(pwd)

if [[ -n $ECLIPSE_HOME ]]; then
	echo -e "Removing unwanted plugins and optimizing ECLIPSE"
	cd "$ECLIPSE_HOME"
	#prep
	echo -e "Creating disabled directories"
	mkdir disabled disabled/features disabled/plugins

	#remove mylyn. In windows use 'move' instead of 'mv'
	echo -e "moving mylyn plugins ........."
	mv plugins/*mylyn* disabled/plugins/
	mv features/*mylyn* disabled/features/

	#remove database related tools
	echo -e "moving datatools plugins ..........."
	mv plugins/*datatools* disabled/plugins/
	mv features/*datatools* disabled/features/

	#if you want to use git from elipse, make sure it is reading the correct .gitconfig which has core.autocrlf=true

	#if you prefer git command line or have some other tool for git, feel free to remove from eclipse
	echo -e "moving git plugins ..........."
	mv features/*git* disabled/features/
	mv plugins/*git* disabled/plugins/

	# finally comeback to
	cd "$currDir"
	echo -e "ECLIPSE optimized"
fi
