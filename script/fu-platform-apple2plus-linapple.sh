# Apple ][+ w/ Linapple w/ certain options

DISTFILE_URL='https://github.com/catseye/linapple/archive/master.zip'

# floppies only, for now
platform_initsys() {
    dd if=/dev/zero of="$1" bs=256 count=683
}

platform_initsetup() {
    echo "No setup image required."
}

platform_initdist() {
    dd if=/dev/zero of="$1" bs=256 count=683
}

platform_start() {
    linapple -d1 "${SYSTEM_IMAGE}" -autoboot
}

platform_setup() {
    echo "Not starting emulator.  No setup image required."
    #linapple -d1 "${SYSTEM_IMAGE}" -autoboot
}

platform_dist() {
    echo "Not starting emulator.  No in-architecture dist steps required."
}

platform_distboot() {
    linapple -d1 "${DIST_IMAGE}" -autoboot
}

platform_install() {
    cp "${INSTALL_IMAGE}" "${SYSTEM_IMAGE}"
}
