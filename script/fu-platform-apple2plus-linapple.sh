# Apple ][+ w/ Linapple w/ certain options

DISTFILE_URL='https://github.com/timob/linapple/archive/master.zip'

# floppies only, for now
platform_initsys() {
    dd if=/dev/zero of="$1" bs=256 count=683
}

platform_initdist() {
    dd if=/dev/zero of="$1" bs=256 count=683
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
