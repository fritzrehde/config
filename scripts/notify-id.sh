#!/bin/sh

# provides unique notification ids for scripts to lock/unlock

TMP=/tmp/notify-id

case "$1" in
	lock)
		mkdir -p "$TMP"
		i=9000
		while ls "$TMP/$i" > /dev/null 2>&1; do
			i=$((i+1))
		done
		touch "$TMP/$i"
		echo "$i"
		;;
	unlock)
		rm -f "$TMP/$2"
		;;
esac

