#!/bin/sh

line_empty() {
	if [ -z "$LINE" ]; then
		echo "\$LINE is empty"
		exit 1
	fi
}

file_id() {
	echo "$LINE" | awk '{ print $1 }' FS="   "
}

case "$1" in
	list)
		gdrive list --no-header --name-width 0 --order name --max 500 \
			| grep bin \
			| sed 's/   */,/g' \
			| awk '{ print $1, $2, $4 }' FS="," OFS="," \
			| column -t -s "," -o "   "
		;;
	delete)
		# TODO: exit on empty line
		line_empty || exit 1
		gdrive delete "$(file_id)"
		;;
	download)
		line_empty
		gdrive download "$(file_id)"
		;;
	upload)
		fileselect.sh | while read FILE; do
			# gdrive upload -r "$FILE" &
			stdbuf -oL gdrive upload -r "$FILE" 2>&1 \
				| stdbuf -i0 -oL tr '\r' '\n' \
				| grep --line-buffered '[^[:blank:]]' \
				| while read LINE; do 
				echo "do something with: $LINE"
			done
		done
		;;
	*)
		watchbind --config-file ~/.local/bin/watchbind/gdrive.toml
		;;
esac
