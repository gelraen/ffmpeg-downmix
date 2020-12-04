.PHONY: all stats
all: $(patsubst %.sh,%.png,$(wildcard *.sh)) stats

stats: $(patsubst %.sh,%.log,$(wildcard *.sh))
	@grep 'Parsed_astats.* Max level' *.log | awk -F: '{sub("\\.log", "", $$1); printf "%s %s\n", $$3, $$1}'| sort -gr -k 1,1 

%.png %.log: %.sh input.mkv Makefile
	sh "$<" input.mkv | ffmpeg -y -i pipe: -filter_complex "asplit[copy],showwavespic=s=640x240:split_channels=0; [copy]astats=measure_perchannel=none[stats]" -frames:v 1 "$*.png" -map '[stats]' -f null /dev/null 2>&1 | tee "$*.log" >&2
