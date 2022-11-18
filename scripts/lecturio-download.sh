#!/bin/sh

# download lecturio videos from selected courses

COURSES=$(
	cat <<-END
	economics-i-wi000021_e-bsc-english-track-ws-2223.kurs
	economics-i-exercise-wi000021_e-ws-2223.kurs
	financial-accounting-wi001059_e-bsc-engl-track-ws-2223.kurs
	END
)

download() {
	URL="$1"
	USERNAME="$2"
	PASSWORD="$3"
	SUBJECT="$(echo "$URL" | tr "/" "\n" | grep ".kurs" | sed 's/\.kurs//')"
	DIR=~/Downloads/videos/$SUBJECT
	mkdir -p $DIR

	# check if file has already been downloaded
	downloads_exist() {
		yt-dlp \
			-u "$USERNAME" -p "$PASSWORD" \
			-o "$DIR/%(title)s.%(ext)s" \
			--print "%(filename)s" \
			"$URL" \
			| xargs -I {} ls "{}" > /dev/null 2>&1
	}

	if downloads_exist; then
		notify-send "Up to date" "$SUBJECT" -t 0
	else
		yt-dlp.sh \
			-u "$USERNAME" -p "$PASSWORD" \
			-o "$DIR/%(title)s.%(ext)s" \
			--embed-metadata \
			"$URL"
	fi
}

# lecturio login credentials
USERNAME="$(ls ~/.password-store/uni/lecturio.de | sed 's/\.gpg//')"
PASSWORD="$(pass uni/lecturio.de/$USERNAME)"

for COURSE in $(echo "$COURSES"); do
	download "https://www.lecturio.de/elearning/$COURSE" "$USERNAME" "$PASSWORD" &
done
