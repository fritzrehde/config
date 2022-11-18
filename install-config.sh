#!/bin/sh

# create theme file if it does not exist
THEME_FILE=~/dotfiles/theme
[ -f $THEME_FILE ] \
	|| echo "dark" > $THEME_FILE

# create all directories
fd --base-directory config --type directory \
	| xargs -I {} mkdir -p ~/.config/{}

# link all config files
fd --base-directory config --type file \
	| xargs -I {} ln -fs $(realpath config/{}) ~/.config/{}

# manually link xinitrc and zshrc
ln -fs ~/.config/xorg/xinitrc ~/.xinitrc
ln -fs ~/.config/zsh/zshrc ~/.zshrc

# link theme specific files
change-theme.sh reload
