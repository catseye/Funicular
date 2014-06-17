Funicular
=========

**Funicular** is a system to semi-automate the creation of development
environments on eclectic architectures.  It is currently vapourware.

Here, "eclectic architectures" is not terribly-well defined, but it includes
retrocomputing and esoteric architectures.  Basically, if you've got an
emulator for it, you might be able to build and run a system for it, using
Funicular.

It's kind of like a Vagrant for the lunatic fringe, eh?

Each funicular is defined by a `Funicularfile`.  This file is written in
the configuration subset of Lua, and gives the configuration for the funicular;
it looks something like

    return {
        platform = NetBSD_6,
        system_image = 'wd0.img',
        setup_image = 'setup-netbsd.iso',
    }

A funicular is generally based around a particular Platform
(Amiga[DOS]-Gondola, NetBSD-Gondola, FreeDOS-Gondola).

The Platform defines a default Architecture, which in turn defines a
default Emulator.

In truth, Architectures are many-to-many with Platforms, which are
many-to-many with Emulators — so there are lots of possibilities, and the
Architecture may vary (NetBSD on i386 vs mips or whatnot) and the
emulator may vary (UAE or E-UAE, QEMU or Bochs, etc.)

Images
------

    Image {
        filename: string
        type: disk-image | cdrom-image | host-file-mapped
    }

An Image has one of three distinct roles:

*   `system_image`: contains one operating system; boots into that operating
    system, if applicable; persistent and mutable; often contains utilities;
    also generally contains a work area for installing and building STUFF
*   `install_image`: CDROM (or other readonly) image which installs the operating
    system to the system-image; generally not needed after that point
*   `setup_image`: CDROM (or other readonly) image which contains STUFF
    to install and build in the work area; ephemeral (recreated by funicular
    as needed from toolshelf sources)

There is a fourth role; from a system-image, a funicular may be able to
create a

*   `work_image`: contains a skeletal operating system and a subset of the
    STUFF so built.  intended to be used as a "distributed product" —
    for other (web) emulators, bootable USB sticks, or whatnot
