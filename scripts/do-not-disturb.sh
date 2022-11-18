#!/bin/sh

case "$(dunstctl is-paused)" in
	false) dunstctl set-paused true ;;
	true) dunstctl set-paused false ;;
esac
polybar-reload.sh do_not_disturb
