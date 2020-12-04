ffmpeg -i "$1" -map 0:a -ac 2 -f matroska pipe:
