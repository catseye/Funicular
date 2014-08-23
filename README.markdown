Funicular
=========

**Funicular** is a system that semi-automates the creation of development
environments on eclectic architectures.  It is currently a work in progress.

"Semi-automate" means it automates what it can, and provides repeatable
instructions for you to follow for what it can't.

"Eclectic architectures" is not terribly-well defined, but it includes
retrocomputing and esoteric architectures.  Basically, if you've got an
emulator for it and install and support images for it, you might be able
to install and outfit and and run a system for it, using Funicular.

It's kind of like a Vagrant for the lunatic fringe, eh?

It currently supports:

*   NetBSD under QEMU
*   FreeDOS under QEMU (to a certain degree)

We hope that it will soon support:

*   AmigaDOS under E-UAE

And one day:

*   Commodore 64 KERNAL under VICE
*   VIC-20 KERNAL under VICE
*   AppleDOS under an Apple 2 emulator

It is hoped that Funicular will eventually replace the discrete, ad-hoc
projects [NetBSD-Gondola](https://github.com/catseye/NetBSD-Gondola),
[FreeDOS-Gondola](https://github.com/catseye/FreeDOS-Gondola), and
[Amiga-Gondola](https://github.com/catseye/Amiga-Gondola).

Concepts
--------

### Funiculars, Platforms, Architectures, Emulators ###

Each funicular is defined by a `Funicularfile` in a particular directory
dedicated to that funicular (in analogy with `Makefile`, `Vagrantfile`, etc.)

A funicular defines a development environment; is generally based around a
particular Platform.  The Platform defines a default Architecture, which in
turn defines a default Emulator.

In truth, it is more complicated than that.  Architectures have a many-to-many
relationship with Platforms, which themselves have a many-to-many relationship
with Emulators.

For example, the NetBSD Platform could be on i386 or MIPS Architecture, and the
QEMU emulator can emulate both i386 and SPARC, while the i386 architecture can
be emulated by both QEMU and Bochs.

Worse, Platforms and Architectures are hierarchical, but not in any clean way.
Amiga Kickstart sits on top of a 680x0 core, and AmigaDOS sits on top of
Kickstart.  The Java platform sits on top of, potentially, many different
platforms.  And so forth.

So, there are lots of possibilities.  But, we can stick to certain "defaults"
for now; not only because they are "opinionated" (I'd rather use QEMU than
Bochs) but also because it makes it a lot simpler.  Hopefully we'll come up
with a sane way to customize all the relationships at some point.

It is useful to remember that a funicular defines an environment (usually a
development environment, with compilers, text editors, and whatever else
might help you develop software.)  So, there can be multiple funiculars
with the exact same Platform and Architecture, but outfit differently and
providing different development environments.

### Images ###

An Image has one of several roles:

*   **System Image**: contains one operating system; boots into that operating
    system, if applicable; persistent and mutable; often contains utilities;
    also generally contains a work area for installing and building STUFF

*   **Support Image**: like a system image, but read-only, but required for
    the Platform or Architecture to operate.  Often in the form of ROM images.
    May or may not be supplied with an Emulator, depending on licensing
    requirements.

*   **Install Image**: CDROM (or other readonly) image which installs the operating
    system to the system-image; generally not needed after that point

*   **Setup Image**: CDROM (or other readonly) image which contains STUFF
    to install and build in the work area; ephemeral (recreated by funicular
    as needed from acquired sources)

*   **Distribution Image**: contains a skeletal operating system and a subset of the
    STUFF so built.  intended to be used as a "distributed product" —
    for other (web) emulators, bootable USB sticks, or whatnot

Usage
-----

To bring up a funicular, you generally follow these steps:

*   Acquire an install image for the Platform (e.g. a NetBSD install ISO.)
*   Acquire an appropriate Emulator (e.g. `toolshelf dock @@qemu`.)
*   Run `funicular init 4000` to create a 4G (or whatever) system image.
*   Run `funicular install` to install the platform onto the system image.
*   Run `funicular setup` to fetch various pieces of software and install
    them too on the system image.
*   Run `funicular start` to use your funicular for whatever you want.

Notes
-----

The Cat's Eye Technologies Platform is a set of funiculars.  (TODO explain
this.)
