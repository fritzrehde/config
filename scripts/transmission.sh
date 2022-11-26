#!/bin/sh

torrent_id () {
	echo "$LINE" | awk '{print $1}'
}

torrent_status () {
	echo "$LINE" | awk '{print $7}'
}

case "$1" in
	list)
		transmission-remote --list | head --lines=-1
		;;
	add)
		transmission-remote --add "$(clipboard-paste.sh)"
		ID="$(torrent_id)"
		;;
	file)
		ID=$(torrent_id)
		# TODO: use awk to only get id
		FILE_INDEX=$(transmission-remote --torrent "$ID" --files | tail --lines="+3" | rofi.sh default -p "file") || exit 1
		transmission-remote --torrent "$ID" --get "$FILE_INDEX"
		;;
	start)
		transmission-remote --torrent "$(torrent_id)" --start
		;;
	stop)
		transmission-remote --torrent "$(torrent_id)" --stop
		;;
	remove)
		transmission-remote --torrent "$(torrent_id)" --remove
		;;
	delete)
		transmission-remote --torrent "$(torrent_id)" --remove-and-delete
		;;
	*)
		watchbind -c ~/dotfiles/config/watchbind/transmission.toml
		;;
esac
