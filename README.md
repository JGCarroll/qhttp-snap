# The Quantum HTTP snap

`sudo snap install qhttp`

This repository contains the files for the [qhttp](https://snapcraft.io/qhttp) snap, a tiny 4KB wrapper of the Python built in webserver, but fully confined by the snapd sandbox! 4KB is the smallest a snap can possibly be, since it is the smallest size allowed by the squashfs filesystem. The entire Python implementation is contained in the core base snap, which is deduplicated with other snaps and usually will be installed by default.

If you need to just quickly send a file across the LAN, or whip up a quick HTTP server for any quick experiments, it's as simple as `qhttp` in the command line, and you can specify the port to bind to with `qhttp -p 12345`, and even get the standard HTTP port, 80, with `sudo qhttp -p 80`.

You'll need to place the files in `$HOME/snap/qhttp/common`, or if you use sudo to address ports <=1024, `/root/snap/qhttp/common`

And of course, keep in mind this snap won't set up NAT traversal for you, you'll need to do this yourself! (Sorry, I tried but it wouldn't be a quantum snap then).
