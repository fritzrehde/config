#!/bin/sh

# unlink all config files
fd --type file \
	| xargs -I {} unlink ~/.config/{}
