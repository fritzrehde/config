#!/bin/sh

COMMIT_MSG="Updated scripts"

cd ~/.local/bin || exit
git add -A
git commit -m "$COMMIT_MSG"
git push

if [ $? -eq 1 ]; then
	DUNST_MSG="Error"
	DUNST_ARGS="-u critical"
else
	DUNST_MSG="Done"
fi
dunstify "$DUNST_MSG" "scripts" -t 2000 $DUNST_ARGS
