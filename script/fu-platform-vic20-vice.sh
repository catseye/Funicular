# Vic 20 w/ VICE w/ certain options

DISTFILE_URL='http://downloads.sourceforge.net/project/vice-emu/releases/vice-2.4.tar.gz'

platform_initsys() {
    mkdir -p "$SYSTEM_IMAGE"
}

platform_initdist() {
    dd if=/dev/zero of=${DIST_IMAGE} bs=256 count=683
    c1541 -attach "$1" -format "DIST,2A" -dir
}

platform_start() {
    xvic -config vicerc -iecdevice8 -device8 1 -fs8 ${SYSTEM_IMAGE}
}

platform_setup() {
    xvic -config vicerc -iecdevice8 -device8 1 -fs8 ${SYSTEM_IMAGE}
}

platform_dist() {
    xvic -config vicerc -iecdevice8 -device8 1 -fs8 ${SYSTEM_IMAGE} -iecdevice9 -9 ${DIST_IMAGE}
}

platform_distboot() {
    xvic -config vicerc -iecdevice8 -device8 1 ${DIST_IMAGE}
}

platform_install() {
    echo "No install step.  Installation will happen during setup."
}
