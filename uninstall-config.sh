#!/bin/sh

# unlink all config files
fd --base-directory config --type file \
	| xargs -I {} unlink ~/.config/{}
