#!/bin/sh

send_notification() {
	VOLUME=$(pamixer --get-volume)
	notify-send "Volume: ${VOLUME}%" -a "ignorehistory" -u low -t 1000 -r 9999 -h int:value:"$VOLUME"
}

case "$1" in
	up)
		pamixer --unmute
		pamixer --increase 5 --allow-boost
		send_notification
		;;
	down)
		pamixer --unmute
		pamixer --decrease 5 --allow-boost
		send_notification
		;;
	mute)
		pamixer --toggle-mute
		if [ "$(pamixer --get-mute)" = "true" ]; then
			notify-send "Muted" -a "ignorehistory" -u low -t 1000 -r 9999
		else
			send_notification
		fi
		;;
esac
polybar-reload.sh mute
