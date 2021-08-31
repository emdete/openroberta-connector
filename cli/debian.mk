#!/usr/bin/make -f
MAINTAINER="M. Dietrich <mdt@emdete.de>"
PROJECT=roberta
VERSION=1.0
ARCH=all
DEPENDS="java-runtime"

all: $(PROJECT)_$(VERSION)_$(ARCH).deb $(PROJECT).html
	chmod 0644 $^

run:

dbg: all

clean:
	rm -f data.tar.gz control.tar.gz debian-binary $(PROJECT)_$(VERSION)_$(ARCH).deb control postrm preinst $(PROJECT).html

$(PROJECT)_$(VERSION)_$(ARCH).deb: debian-binary control.tar.gz data.tar.gz
	ar -r $(PROJECT)_$(VERSION)_$(ARCH).deb debian-binary control.tar.gz data.tar.gz

debian-binary: Makefile
	echo 2.0 > debian-binary

control.tar.gz: control preinst postrm
	fakeroot tar czf control.tar.gz control preinst postrm

data.tar.gz: Makefile
	fakeroot tar czCf debian data.tar.gz usr

debian/usr/share/doc/$(PROJECT)/README: Makefile
	mkdir -pv debian/usr/share/doc/$(PROJECT)
	echo This package provides the $(PROJECT). > debian/usr/share/doc/$(PROJECT)/README

$(PROJECT).html: README.md
	markdown_py -f $@ -e utf-8 -v -o html5 $<

control: Makefile
	echo Package: $(PROJECT) > control
	echo Version: $(VERSION) >> control
	echo Section: user/misc >> control
	echo Priority: optional >> control
	echo Depends: $(DEPENDS) >> control
	echo Architecture: $(ARCH) >> control
	echo Installed-Size: `du -ks debian/|cut -f 1` >> control
	echo Maintainer: $(MAINTAINER) >> control
	echo Description: This package provides the $(PROJECT). >> control

preinst: Makefile
	echo '#!/bin/sh' > preinst
	echo 'exit 0' >> preinst

postrm: Makefile
	echo '#!/bin/sh' > postrm
	echo 'exit 0' >> postrm


