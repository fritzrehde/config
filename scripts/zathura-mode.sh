#!/bin/sh

WID=$(xdo id)
PDF="$1"
CONFIG="$2"

xdo close "$WID"
case $3 in
	normal)
		zathura -c ~/.config/$CONFIG "$PDF" &
		;;
	fullscreen)
		zathura -c ~/.config/$CONFIG "$PDF" --mode fullscreen &
		;;
esac
