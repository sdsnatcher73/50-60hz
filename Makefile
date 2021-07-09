
all:
	mkdir -p bin
	java -jar tools/glass.jar src/50hz.asm bin/50hz.com
	java -jar tools/glass.jar src/60hz.asm bin/60hz.com