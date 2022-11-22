#!/bin/sh

# create new shell script

SCRIPTS=~/dotfiles/scripts
FILENAME="$(rofi.sh top -p "name")" || exit 1
FILE=$SCRIPTS/$FILENAME.sh
LINK_TO=~/.local/bin/$FILENAME.sh

printf "#!/bin/sh\n\n\n" > "$FILE"
chmod +x "$FILE"
ln -fs "$FILE" "$LINK_TO"
nvim + "$FILE"
