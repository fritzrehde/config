#!/bin/sh

# create all directories
fd --type directory \
	| xargs -I {} mkdir -p ~/.config/{}

# link all config files
fd --type file \
	| xargs -I {} ln -fs $(realpath {}) ~/.config/{}

# manually link xinitrc and zshrc
ln -fs ~/.config/xorg/xinitrc ~/.xinitrc
ln -fs ~/.config/zsh/zshrc ~/.zshrc

# link theme specific files
change-theme.sh reload
