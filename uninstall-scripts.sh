#!/bin/sh

SCRIPTS=~/.local/bin

# unlink all shell scripts
fd --base-directory scripts --type file \
	| xargs -I {} unlink $SCRIPTS/{}
