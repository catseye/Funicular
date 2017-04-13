Funicular
=========

*Version 0.4-PRE*

**Funicular** is a system that semi-automates the creation of development
environments on eclectic architectures.

"Semi-automate" means it automates what it can, and provides repeatable
instructions for you to follow for what it can't.

"Development environment" means an environment in which you can build
(and perhaps even write) software.  Thus it is typically populated with
programming language interpreters and compilers, debuggers, text editors,
and the like.

"Eclectic architectures" is not terribly-well defined, but it includes
retrocomputing and esoteric architectures.  Basically, if you've got an
emulator for it, and installation images for it, you might be able to
install and outfit and run a system for it, using Funicular.

It's kind of like a Vagrant for the lunatic fringe, eh?

It is currently a work in progress.  The current released version of
Funicular is **version 0.3**, but this means next to nothing.

It currently supports:

*   i386 running NetBSD under QEMU
*   i386 running FreeDOS under QEMU
*   Commodore 64 with a 1541 floppy drive under VICE
*   VIC-20 with a 1541 floppy drive under VICE

And partially supports:

*   Apple //e running AppleDOS under Linapple

Funicular unifies and replaces the discrete, ad-hoc projects NetBSD-Gondola,
FreeDOS-Gondola, and Amiga-Gondola.

Quick(ish) Start
----------------

*   `cd` into a directory that has a `Funicularfile`.
*   Run `funicular init system`.
*   Acquire the appropriate install image.
*   Run `funicular install`.
*   Run `funicular init setup`.
*   Run `funicular setup`.
*   ...

Concepts
--------

*This is probably out of date now.*

### Funiculars, Platforms, Architectures, EmulatorModes, Emulators ###

Each Funicular is defined by a `Funicularfile` in a particular directory
dedicated to that Funicular (in analogy with `Makefile`, `Vagrantfile`, etc.)

A Funicular defines a development environment; is generally based around a
particular Platform.  The Platform defines a default Architecture, which in
turn defines a default EmulatorMode (which is provided by an Emulator.)

In truth, it is more complicated than that.  Platforms have a many-to-many
relationship with Architectures, which themselves have a many-to-many
relationship with EmulatorModes, which themselves have a many-to-one
relationship with Emulators.

Examples:

*   NetBSD and FreeDOS (Platforms) can both run on i386 (Architecture)
*   NetBSD (Platform) can run on both i386 and MIPS (Architectures)
*   i386 (Architecture) can be emulated by both QEMU-i386 and Bochs
    (EmulatorModes)
*   QEMU (Emulator) can emulate both QEMU-i386 and QEMU-SPARC (EmulatorModes)

Worse, Platforms and Architectures are hierarchical, but not in any clean way.
Amiga Kickstart sits on top of a 680x0 core, and AmigaDOS sits on top of
Kickstart.  The Java platform sits on top of, potentially, many different
platforms.  And so forth.

So, there are lots of possibilities.  But, we can stick to certain "defaults"
for now; not only because they are "opinionated" (I'd rather use QEMU than
Bochs) but also because it makes it a lot simpler.  Hopefully we'll come up
with a sane way to customize all the relationships at some point.

It is useful to remember that a Funicular defines an environment (usually a
development environment, with compilers, text editors, and whatever else
might help you develop software.)  So, there can be multiple Funiculars
with the exact same Platform and Architecture, but outfit differently and
providing different development environments.

### Images ###

An Image represents contents of a storage medium.  It is usually implemented
on the host system as a file (e.g. a disk image or a ROM image) or as a
directory of files (e.g. a "virtual disk".)  An Image has one of several roles:

*   **System Image**: contains one operating system; boots into that operating
    system, if applicable; persistent and mutable; often contains utilities;
    also often contains a work area for installing and building STUFF.
    
*   **Support Image**: like a system image, but read-only, but required for
    the Platform or Architecture to operate.  Often in the form of ROM images.
    May or may not be supplied with an Emulator, depending on licensing
    requirements.
    
*   **Install Image**: CDROM (or other readonly) image which installs the
    operating system to a System Image; generally not needed after that
    point.
    
*   **Setup Image**: CDROM (or other readonly) image which contains STUFF
    to install and build in the work area; ephemeral (recreated by the
    `funicular` tool, as needed, from acquired sources.)
    
*   **Distribution Image**: contains a skeletal operating system and a subset
    of the  STUFF so built.  Intended to be used as a "distributed product" —
    for emulators (possibly web-based), bootable USB sticks, or whatnot.

Usage
-----

To create a Funicular, you generally follow this series of steps:

*   Acquire an install image for the Platform (e.g. a NetBSD install ISO.)
*   Acquire an appropriate Emulator (e.g. `toolshelf dock @@qemu`.)
*   Run `funicular init 4000` to create a System Image 4 gigabytes in size
    (or however large you actually need it to be).
*   Run `funicular install` to install the Platform onto the System Image.
    If the Platform requires them, Support Images may be needed at this point.
*   Run `funicular setup` to fetch various pieces of software, create
    a Setup Image with them, and install them onto the System Image.
*   Run `funicular start` to use your Funicular for whatever you want.

After `install` and `setup`, or at any time thereafter, you may wish to
run `funicular backup` to create a compressed backup copy of the system
image at that point.  Restoring from such a backup will generally be faster
and easier than installing or setting up again.

Certain funiculars may support creating a distribution image.  To create
a distribution image, you generally follow these steps:

*   Make sure the Funicular has been set up as above.
*   Run `funicular initdist 720` to create a 720K (or whatever) dist image.
*   Run `funicular builddist`.  It will check that there is a dist image
    present, and may print out specific instructions.
*   Formatting and populating the dist image is Funicular-dependent.
    Look for instructions that might have been printed out.
    If the distribution can be created entirely on the host, the emulator
    might not even be started.
*   After the dist image is how you like it, shut down the emulator using
    the recommended method for doing so.
*   Run `funicular distboot` to try to boot off the dist image, if it is
    bootable.

Notes
-----

The reference implementation of the `funicular` tool is written in Bourne
shell.  A `Funicularfile` is also written in Bourne shell, but it mostly
contains configuration, not functionality.

The contents of this repository are in the public domain.  This, of course,
applies only to the contents of this repository, and not to the contents of
any particular Funicular you build with with this software.  See the file
`UNLICENSE` in this directory for more information.
