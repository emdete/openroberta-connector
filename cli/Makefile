#!/usr/bin/make -f
.PHONY: all run clean doc dist dbg gui debian cli

all: debian

cli:
	cd .. && mvn package
	ln -sf ../target/libs .
	ln -sf ../../../src/main/java/de/fhg java/de
	ant -emacs all

run:
	ant -emacs run

dbg:
	ant -emacs dbg

gui:
	ant -emacs gui

debian: cli
	ant -emacs ar
	cp -a ../resources/. resources/.
	cp -a ../installers/linux/resources/. resources/.
	cp logback.xml resources/.
	mkdir -p debian/usr/share/roberta
	mkdir -p debian/usr/share/applications
	cp -ar roberta.jar roberta.sh resources/ libs/ debian/usr/share/roberta
	cp -ar roberta.desktop debian/usr/share/applications
	rm -f roberta_*_all.deb
	make -f debian.mk

clean:
	ant -emacs clean
	make -f debian.mk clean
	rm -f libs java/de/fhg
	rm -rf debian/ resources/

