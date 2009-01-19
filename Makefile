CFLAGS = -fpascal-strings -O2 -arch ppc -arch i386 -Wall -ggdb
.PHONY: clean dist

flow: flow.o
	g++ -o $@ $^ -O2 \
	  -framework CoreFoundation -framework ApplicationServices

makeicns: makeicns.o IconFamily.o NSString+CarbonFSRefCreation.o
	g++ -o $@ $^ -O2 -arch ppc -arch i386 \
	  -framework Foundation -framework AppKit -framework Carbon

test:
	python docerator_test.py

clean:
	rm -rf flow makeicns flow.o makeicns.o IconFamily.o NSString+CarbonFSRefCreation.o

dist: makeicns flow test
	rm -rf docerator-1.0.zip
	zip docerator-1.0.zip makeicns docerator.py flow
