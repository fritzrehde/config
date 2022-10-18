#!/bin/sh

# create all directories
fd --type directory \
	| xargs -I {} mkdir -p ~/.config/{}

# link all config files
fd --type file \
	| xargs -I {} ln -fs $(realpath {}) ~/.config/{}

# link theme specific files
change-theme.sh reload
