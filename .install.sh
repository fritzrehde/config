#!/bin/sh

# link all config files to ~/.config folder

fd --type file \
	| xargs -I {} ln -fs $(realpath {}) ~/.config/{}
