#!/bin/sh

# i386 w/ QEMU 1.6.2 w/ certain options

DISTFILE_URL='http://wiki.qemu-project.org/download/qemu-1.6.2.tar.bz2'

start() {
    qemu-system-i386 -hda "${SYSTEM_IMAGE}"
}

setup() {
    qemu-system-i386 -hda "${SYSTEM_IMAGE}" -cdrom "${SETUP_IMAGE}"
}

dist() {
    qemu-system-i386 -hda "${SYSTEM_IMAGE}" -fda "${DIST_IMAGE}"
}

distboot() {
    qemu-system-i386 -fda "${DIST_IMAGE}" -boot order=a
}

install() {
    qemu-system-i386 -hda "${SYSTEM_IMAGE}" -cdrom "${INSTALL_IMAGE}" -boot order=d
}

$1 $*



