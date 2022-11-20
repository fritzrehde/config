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

upload_file() {
	FILE="$1"
	ID="$(notify-id.sh lock)"
	TITLE="$(basename "$FILE")"
	IFS=',' # for read while loop
	stdbuf -oL gdrive upload -r "$FILE" 2>&1 \
		| stdbuf -i0 -oL tr '\r' '\n' \
		| grep --line-buffered -e "[^[:blank:]].*Rate:" \
		| stdbuf -i0 -oL sed -e 's/ //g' -e 's/\//,/' -e 's/,Rate:/,/' -e 's/B//g' -e 's/\/s//' \
		| stdbuf -i0 -oL numfmt -d "," --field=- --from=auto \
		| stdbuf -i0 -oL awk '{ printf "%02d,%.1f MB/s,%d MB\n", $1*100/$2, $3/1000000, $2/1000000 }' FS="," \
		| while read PERC SPEED SIZE; do 
		notify-send "Download ${PERC}% at ${SPEED} of ${SIZE}" "$TITLE" -r "$ID" -h "int:value:${PERC}" -t 0
	done
	notify-id.sh unlock "$ID"
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
			upload_file "$FILE" &
		done
		;;
	*)
		watchbind --config-file ~/dotfiles/config/watchbind/gdrive.toml
		;;
esac
