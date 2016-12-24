#!/bin/sh

# Amiga 500 w/ E-UAE w/ certain options

DISTFILE_URL='http://www.rcdrummond.net/uae/e-uae-0.8.29-WIP4/e-uae-0.8.29-WIP4.tar.bz2'

start() {
    uae -s bogomem_size=4 -s cpu_speed=max -s floppy_speed=800 -s "filesystem2=rw,DH0:Funicular:${SYSTEM_IMAGE},1"
}

setup() {
    uae -s bogomem_size=4 -s cpu_speed=max -s floppy_speed=800 -s "filesystem2=rw,DH0:Funicular:${SYSTEM_IMAGE},1" -s "floppy0=${SETUP_IMAGE}"
}

dist() {
    uae -s bogomem_size=4 -s cpu_speed=max -s floppy_speed=800 -s "floppy0=${DIST_IMAGE}" -s "filesystem2=rw,DH0:Funicular:${SYSTEM_IMAGE},1"
}

distboot() {
    uae -s bogomem_size=4 -s cpu_speed=max -s floppy_speed=800 -s "floppy0=${DIST_IMAGE}"
}

install() {
    echo "No install step.  Installation will happen during setup."
}

$1 $*
