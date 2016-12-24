#!/bin/sh

# Commodore 64 w/ VICE w/ certain options

DISTFILE_URL='http://downloads.sourceforge.net/project/vice-emu/releases/vice-2.4.tar.gz'

start() {
    x64 -config vicerc -iecdevice8 -device8 1 -fs8 "${SYSTEM_IMAGE}"
}

setup() {
    x64 -config vicerc -iecdevice8 -device8 1 -fs8 "${SYSTEM_IMAGE}"
}

dist() {
    x64 -config vicerc -iecdevice8 -device8 1 -fs8 "${SYSTEM_IMAGE}" -iecdevice9 -9 "${DIST_IMAGE}"
}

distboot() {
    x64 -config vicerc -iecdevice8 -device8 1 "${DIST_IMAGE}"
}

install() {
    echo "No install step.  Installation will happen during setup."
}

$1 $*
