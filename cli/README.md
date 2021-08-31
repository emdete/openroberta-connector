Open Roberta CLI
==

Intention
--

This directory contains a hack to provide a CLI for Open Roberta. It is not trying to auto detect anything but gets its config from the command line.

Buidling
--

Just call make - a Debian-Package is created that can be installed.

Note
--

The newer Arduino Nano Contain a new bootloaded. Cheap Nanos do not contain this so this CLI contains a patch to support the old bootloader.

