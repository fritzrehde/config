#!/bin/sh

_git() {
	git -C ~/dotfiles "$@"
}

if COMMIT_MSG="$(rofi.sh top -p "commit-msg")"; then
	[ "$COMMIT_MSG" = "" ] \
		&& COMMIT_MSG="Updated some dotfiles"
else
	exit 1
fi

ADDED="$(_git add -A --dry-run)"
notify-send "dotfiles" "$ADDED"

if rofi.sh top -p "continue?" > /dev/null; then
	_git add -A \
		&& _git commit -m "$COMMIT_MSG" \
		&& _git push
	notify-send "dotfiles" "pushed"
else
	exit 1
fi
