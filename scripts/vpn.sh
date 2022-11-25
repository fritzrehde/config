#!/bin/sh

case $1 in
	toggle|t)
		if nordvpn status | grep -q "Connected"; then
			vpn.sh disconnect
		else
			vpn.sh connect
		fi
		;;
	connect|c)
		nordvpn connect && polybar-reload.sh vpn
		;;
	disconnect|d)
		nordvpn disconnect && polybar-reload.sh vpn
		;;
	status|s)
		nordvpn status
		;;
	*)
		echo "Usage: $(basename $0) [toggle|connect|disconnect|status]"
esac