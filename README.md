Funicular
=========

*Version 0.6.  Work-in-progress.  Subject to change in backwards-incompatible ways.*

**Funicular** is a system that semi-automates the creation of computing
environments on eclectic architectures.

"Semi-automate" means it automates what it can, and provides repeatable
instructions for you to follow for what it can't.

"Computing environment" could mean a "development environment", i.e.
a system in which you can build (and perhaps even write) software,
populated with interpreters and compilers, debuggers, text editors,
and the like.  Or it could mean any other environment that could be
set up on a computer system.

"Eclectic architectures" is not terribly-well defined, but it includes
retrocomputing and esoteric architectures.  Basically, if you've got an
emulator for it, and installation images for it, you might be able to
install and outfit and run a system for it, using Funicular.

TL;DR it's kind of like a Vagrant, but instead of provisioning VMs, it
provisions emulators.

It currently supports:

*   i386 running NetBSD under QEMU
*   i386 running FreeDOS under QEMU
*   Amiga 500 (etc) running AmigaDOS under E-UAE
*   Commodore 64 with a 1541 floppy drive under VICE
*   VIC-20 with a 1541 floppy drive under VICE
*   Apple //e running AppleDOS under Linapple

Funicular unifies and replaces the older, discrete, ad-hoc projects
NetBSD-Gondola, FreeDOS-Gondola, and Amiga-Gondola, which are now deprecated.

Quick Start
-----------

*   `cd` into a directory that has a `Funicularfile`.
*   Run `funicular init system`.
*   Acquire the appropriate install image.
*   Run `funicular install`.
*   Run `funicular init setup`.
*   Run `funicular setup`.
*   You now have a configured Funicular.  Run `funicular start` to use it.

Documentation
-------------

The reference implementation of the `funicular` tool is written in Bourne
shell.  A `Funicularfile` is also written in Bourne shell, but it mostly
contains configuration, not functionality.

You can look at the settings in the example Funicularfiles in `eg/` and
look them up in the source code in `script/` to divine what they mean.

Because the entire thing was recently rewritten (converting it from
Lua to Bourne shell), there really isn't any further documentation right
now except for [this out-of-date set of notes](doc/Notes.md).

License
-------

The contents of this repository are in the public domain.  This, of course,
applies only to the contents of this repository, and not to the contents of
any particular Funicular you build with with this software.  See the file
`UNLICENSE` in this directory for more information.
