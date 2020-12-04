# Comparison of various methods of downmixing 5.1 to stereo in ffmpeg

This is a followup to a thread on [forums.plex.tv](https://forums.plex.tv/t/feature-request-use-ffmpegs-ac-flag-for-downmixing/659199).

TL;DR: I'm bothered by the fact that when Plex downmixes multichannel audio to
stereo, volume of speech is way too low. This is an attempt to find how to
modify `Plex Transcoder` flags to achieve better results.

## Overview

I took a short clip as a source, named `input.mkv`. Running `make` in this
directory then generates PNG files with audio waveforms for each of `*.sh`
files.

In addition to that, log files are saved and max peak level is extracted for 
sorting.

Partial command line that Plex uses is in `aresample.sh`.

## Results

```
 0.495810 source
 0.465214 aresample-no_rematrix_maxval-ac
 0.465214 aresample-no_rematrix_maxval
 0.465214 ac-2
 0.455529 loudnorm-aresample-no_rematrix_maxval_ac
 0.455529 loudnorm-aresample-no_rematrix_maxval
 0.455529 aresample-loudnorm-aresample
 0.189032 aresample-ac
 0.189032 aresample
 0.179328 loudnorm-aresample-ac
 0.179328 loudnorm-aresample
 ```
