#!/bin/sh

# select files in new terminal and return results

TMP="$(mktemp --dry-run "/tmp/XXXXXX")"
kitty --class floating_tall sh -c \
	"fd --no-ignore --type file --absolute-path | fzf.sh $FZF_ARGS > $TMP"
STDOUT="$(cat "$TMP")"
rm -f "$TMP"
echo "$STDOUT"
