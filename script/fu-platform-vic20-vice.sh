#!/bin/sh

# Vic 20 w/ VICE w/ certain options

DISTFILE_URL='http://downloads.sourceforge.net/project/vice-emu/releases/vice-2.4.tar.gz'

start() {
    xvic -config vicerc -iecdevice8 -device8 1 -fs8 ${SYSTEM_IMAGE}
}

setup() {
    xvic -config vicerc -iecdevice8 -device8 1 -fs8 ${SYSTEM_IMAGE}
}

dist() {
    xvic -config vicerc -iecdevice8 -device8 1 -fs8 ${SYSTEM_IMAGE} -iecdevice9 -9 ${DIST_IMAGE}
}

distboot() {
    xvic -config vicerc -iecdevice8 -device8 1 ${DIST_IMAGE}
}

install() {
    echo "No install step.  Installation will happen during setup."
}

$1 $*
