#!/bin/sh

rofi.sh bottom -p man \
	| xargs -I {} tmux new-window -a "man {}"

# tmux command-prompt -p "man" "new-window -a \"man %1\""
