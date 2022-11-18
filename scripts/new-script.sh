#!/bin/sh

# create new shell script

if [ -z "$1" ]; then
	echo "Usage: $(basename $0) <NAME>"
	exit 1
fi

FILE=~/.local/bin/$1.sh
printf "#!/bin/sh\n\n\n" > "$FILE"
chmod +x "$FILE"
nvim + $FILE
