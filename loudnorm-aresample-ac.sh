ffmpeg -i "$1" -map 0:a -filter_complex "loudnorm,aresample=async=1:rematrix_maxval=0.000000dB:osr=48000" -ac 2 -f matroska pipe:
