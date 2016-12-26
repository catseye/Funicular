# Amiga 500 w/ E-UAE w/ certain options

DISTFILE_URL='http://www.rcdrummond.net/uae/e-uae-0.8.29-WIP4/e-uae-0.8.29-WIP4.tar.bz2'

OPTS="-s bogomem_size=4 -s cpu_speed=max -s floppy_speed=800"

platform_initsys() {
    mkdir -p "$SYSTEM_IMAGE"
}

platform_initdist() {
    dd if=/dev/zero of="$1" bs=1K count=880
}

platform_start() {
    uae ${OPTS} -s "filesystem2=rw,DH0:Funicular:${SYSTEM_IMAGE},1"
}

platform_setup() {
    uae ${OPTS} -s "filesystem2=rw,DH0:Funicular:${SYSTEM_IMAGE},1" -s "floppy0=${SETUP_IMAGE}"
}

platform_dist() {
    uae ${OPTS} -s "floppy0=${DIST_IMAGE}" -s "filesystem2=rw,DH0:Funicular:${SYSTEM_IMAGE},1"
}

platform_distboot() {
    uae ${OPTS} -s "floppy0=${DIST_IMAGE}"
}

platform_install() {
    echo "No install step.  Installation will happen during setup."
}
