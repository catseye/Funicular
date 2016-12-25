# Apple ][+ w/ Linapple w/ certain options

DISTFILE_URL='https://github.com/timob/linapple/archive/master.zip'

platform_initdist() {
    dd if=/dev/zero of=${DIST_IMAGE} bs=256 count=683
}

platform_initsys() {
    dd if=/dev/zero of=${SYSTEM_IMAGE} bs=1M count=${SIZE}
}

platform_start() {
    linapple
}

platform_setup() {
    linapple
}

platform_dist() {
    linapple
}

platform_distboot() {
    linapple
}

platform_install() {
    echo "No install step.  Installation will happen during setup."
}
