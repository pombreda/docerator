CFLAGS = -fpascal-strings -O2 -arch ppc -arch i386 -Wall -ggdb
.PHONY: clean dist

flow: flow.o
	g++ -o $@ $^ -O2 \
	  -framework CoreFoundation -framework ApplicationServices

makeicns: makeicns.o IconFamily.o NSString+CarbonFSRefCreation.o
	g++ -o $@ $^ -O2 -arch ppc -arch i386 \
	  -framework Foundation -framework AppKit -framework Carbon

clean:
	rm -rf flow makeicns flow.o makeicns.o IconFamily.o NSString+CarbonFSRefCreation.o

dist: makeicns
	rm -rf makeicns-1.0.zip
	zip makeicns-1.0.zip Makefile makeicns.m IconFamily.m IconFamily.h \
	  NSString+CarbonFSRefCreation.m NSString+CarbonFSRefCreation.h \
	  makeicns
