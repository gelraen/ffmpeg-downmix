ffmpeg -i "$1" -map 0:a -filter_complex "loudnorm,aresample=async=1:ocl='stereo':osr=48000" -f matroska pipe:
