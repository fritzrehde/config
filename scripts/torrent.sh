#!/bin/sh

torrent_ids () {
	echo "$LINES" \
		| cut -d "," -f 1 \
		| xargs | tr ' ' ',' | tr -d '\n'
}

case "$1" in
	list)
		# TODO: add ETA: support fixed specifiers, minutes, done state (displays -1)
		# transmission-remote --json --list \
		# 	| jq -r '.arguments.torrents[] | "\(.id),\(.eta),\(.leftUntilDone),\(.sizeWhenDone),\(.rateDownload),\(.rateUpload),\(.name),\(.status)"' \
		# 	| awk '{ printf "%d,%1d,%03d,%-3d%,%.1f MB/s,%.1f MB/s,%s\n", $1, $8, ($4 - $3)*100/$4, ($4 - $3)*100/$4, $5/1000000, $6/1000000, $7 }' FS="," OFS="," \
		# 	| awk '{ if (NR!=3) { "asciibar -l 8 -b '=' "$3"" | getline progress; $3 = progress} } 1' FS="," OFS=","

		IFS=',' # delimiter for read

		echo "ID,STATUS,BAR,PERC,DOWN,UP,NAME"
		transmission-remote --json --list \
			| jq -r '.arguments.torrents[] | "\(.id),\(.eta),\(.leftUntilDone),\(.sizeWhenDone),\(.rateDownload),\(.rateUpload),\(.name),\(.status)"' \
			| while read id eta size_left total download upload name status; do 
					percentage="$(echo "((${total} - ${size_left}) * 100) / ${total}" | bc)";
					progress_bar="$(asciibar --length=8 --border="|" ${percentage})"
					# TODO: improve fixed float calculation (allow dynamic unit depending on speed through explizit tool)
					download="$(echo "$download" | awk '{ printf("%.1f", $1/1000000) }')"
					upload="$(echo "$upload" | awk '{ printf "%.1f", $1/1000 }')"
					printf "%d,%1d,%s,%-3d%%,%s MB/s,%s KB/s,%s\n" "$id" "$status" "$progress_bar" "$percentage" "$download" "$upload" "$name"
			done
		;;
	add)
		transmission-remote --add "$(clipboard-paste.sh)"
		;;
	start)
		transmission-remote --torrent "$(torrent_ids)" --start
		;;
	stop)
		transmission-remote --torrent "$(torrent_ids)" --stop
		;;
	remove)
		transmission-remote --torrent "$(torrent_ids)" --remove
		;;
	delete)
		transmission-remote --torrent "$(torrent_ids)" --remove-and-delete
		;;
	file)
		ID=$(torrent_ids)
		# TODO: use awk to only get id
		FILE_INDEX=$(transmission-remote --torrent "$ID" --files | tail --lines="+3" | rofi.sh default -p "file") || exit 1
		transmission-remote --torrent "$ID" --get "$FILE_INDEX"
		;;
	*)
		watchbind -c ~/dotfiles/config/watchbind/torrent.toml
		;;
esac
