CFLAGS = -fpascal-strings -O2 -arch ppc -arch i386 -Wall -ggdb
.PHONY: clean dist gui test

flow: flow.o
	g++ -o $@ $^ -O2 \
	  -framework CoreFoundation -framework ApplicationServices

makeicns: makeicns.o IconFamily.o NSString+CarbonFSRefCreation.o
	g++ -o $@ $^ -O2 -arch ppc -arch i386 \
	  -framework Foundation -framework AppKit -framework Carbon

test:
	python docerator_test.py

clean:
	rm -rf flow makeicns flow.o makeicns.o IconFamily.o \
		NSString+CarbonFSRefCreation.o *.pyc docerator-*.zip gui/build \
		Docerator.app

gui:
	cd gui && xcodebuild -target Docerator -configuration Release && \
		cp -r build/Release/Docerator.app ..

dist: makeicns flow test gui
	rm -rf docerator-*.zip
	zip -r docerator-2.0.zip \
		makeicns docerator.py flow examples/acorn.py README.txt Docerator.app
