#!/bin/sh

SCRIPTS=~/.local/bin

# create bin directory
[ -d $SCRIPTS ] \
	|| mkdir $SCRIPTS

# link all shell scripts
fd --base-directory scripts --type file \
	| xargs -I {} ln -fs $(realpath scripts/{}) $SCRIPTS/{}
