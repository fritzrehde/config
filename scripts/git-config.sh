#!/bin/sh

_git() {
	git -C ~/config "$@"
}

if COMMIT_MSG="$(rofi.sh top -p "commit-msg")"; then
	[ "$COMMIT_MSG" = "" ] \
		&& COMMIT_MSG="Updated some config files"
else
	exit 1
fi

ADDED="$(_git add -A --dry-run)"
notify-send "config" "$ADDED"

if rofi.sh top -p "continue?" > /dev/null; then
	_git add -A \
		&& _git commit -m "$COMMIT_MSG" \
		&& _git push
	notify-send "config" "pushed"
else
	exit 1
fi
