#!/bin/sh

RESOLUTION=$(xrandr | grep "*" | awk '{ print $1 }')
WIDTH=$(echo "$RESOLUTION" | cut -d "x" -f 1)
HEIGHT=$(echo "$RESOLUTION" | cut -d "x" -f 2)
echo "SCREEN: ${WIDTH}x${HEIGHT}"

for i in floating_small floating_tall
do
	case $i in
		floating_small)
			W=$(echo "scale=0; (${WIDTH}*0.44)/1" | bc)
			H=$(echo "scale=0; (${HEIGHT}*0.10)/1" | bc)
			;;
		floating_tall)
			W=$(echo "scale=0; (${WIDTH}*0.44)/1" | bc)
			H=$(echo "scale=0; (${HEIGHT}*0.88)/1" | bc)
			;;
	esac
	X=$(echo "scale=0; (${WIDTH}-${W})/2" | bc)
	Y=$(echo "scale=0; (${HEIGHT}-${H})/2" | bc)

	bspc rule -a "$i" state=floating focus=on rectangle=${W}x${H}+${X}+${Y}
	echo "$i: ${W}x${H}+${X}+${Y}"
done
