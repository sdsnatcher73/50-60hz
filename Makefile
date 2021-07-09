
all:
	mkdir -p bin
	java -jar tools/glass.jar src/50hz.asm bin/50hz.com
	java -jar tools/glass.jar src/60hz.asm bin/60hz.com

dist: all
	rm -f bin/50-60hz.zip
	zip -j bin/50-60hz.zip bin/50hz.com bin/60hz.com