#!/bin/sh

# Apple ][+ w/ Linapple w/ certain options

DISTFILE_URL='https://github.com/timob/linapple/archive/master.zip'

initdist() {
    dd if=/dev/zero of=${DIST_IMAGE} bs=256 count=683
}

initsys() {
    dd if=/dev/zero of=${SYSTEM_IMAGE} bs=1M count=${SIZE}
}

start() {
    linapple
}

setup() {
    linapple
}

dist() {
    linapple
}

distboot() {
    linapple
}

install() {
    echo "No install step.  Installation will happen during setup."
}

CMD=$1
shift
$CMD $*
