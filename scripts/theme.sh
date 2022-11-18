#!/bin/sh

# get and set current color theme

THEME_FILE=~/dotfiles/theme

if [ -n "$1" ]; then
	# set
	echo "$1" > $THEME_FILE
else
	# get
	cat $THEME_FILE
fi
