#!/bin/sh

SCRIPTS=~/.local/bin

# create bin directory
[ -d $SCRIPTS ] \
	|| mkdir $SCRIPTS

# link all shell scripts
fd --base-directory scripts --type file \
	| xargs -I {} ln -fs $(realpath scripts/{}) $SCRIPTS/{}

# remove broken symlinks
find -L $SCRIPTS -maxdepth 1 -type l -delete
