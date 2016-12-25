#!/bin/sh

# Amiga 500 w/ E-UAE w/ certain options

DISTFILE_URL='http://www.rcdrummond.net/uae/e-uae-0.8.29-WIP4/e-uae-0.8.29-WIP4.tar.bz2'
VIRTUAL_SYSTEM_IMAGE=True

OPTS="-s bogomem_size=4 -s cpu_speed=max -s floppy_speed=800"

initdist() {
        #-- TODO: this is a little restrictive
        #if size ~= '880' then
        #    print "Only supported sizes: 880"
        #    os.exit(1)
        #end
        #execute(funicular, "dd if=/dev/zero of=${DIST_IMAGE} bs=1K count=" .. size)
}

start() {
    uae ${OPTS} -s "filesystem2=rw,DH0:Funicular:${SYSTEM_IMAGE},1"
}

setup() {
    uae ${OPTS} -s "filesystem2=rw,DH0:Funicular:${SYSTEM_IMAGE},1" -s "floppy0=${SETUP_IMAGE}"
}

dist() {
    uae ${OPTS} -s "floppy0=${DIST_IMAGE}" -s "filesystem2=rw,DH0:Funicular:${SYSTEM_IMAGE},1"
}

distboot() {
    uae ${OPTS} -s "floppy0=${DIST_IMAGE}"
}

install() {
    echo "No install step.  Installation will happen during setup."
}

CMD=$1
shift
$CMD $*
