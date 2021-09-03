Open Roberta CLI
==

Intention
--

This directory contains a hack to provide a CLI for Open Roberta. It gets its
config from the command line and does no auto-detect magic which may fail.

Building
--

Just run `make` - a Debian-Package is created that can be installed.

Run Open Roberta Connector
--

A `.desktop`-File is provided, once installed the program shows up in the menu
of your desktop system.

Note
--

The newer Arduino Nano Contain a new bootloaded using a different baud rate for
flashing. Cheap Nanos do not contain this so this CLI contains a patch to
support the old bootloader.

