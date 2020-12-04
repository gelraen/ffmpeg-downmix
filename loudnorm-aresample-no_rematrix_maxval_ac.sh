ffmpeg -i "$1" -map 0:a -filter_complex "loudnorm,aresample=async=1:osr=48000" -ac 2 -f matroska pipe:
