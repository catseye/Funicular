# i386 w/ QEMU 1.6.2 w/ certain options

DISTFILE_URL='http://wiki.qemu-project.org/download/qemu-1.6.2.tar.bz2'

platform_initsys() {
    dd if=/dev/zero of=${SYSTEM_IMAGE} bs=1M count=${SIZE}
}

platform_initdist() {
        #-- TODO: this is a little restrictive
        #if size ~= '360' and size ~= '720' and size ~= '1440' then
        #    print "Only supported sizes: 360, 720 and 1440"
        #    os.exit(1)
        #end
        #execute(funicular, "dd if=/dev/zero of=${DIST_IMAGE} bs=1K count=" .. size)
}

platform_start() {
    qemu-system-i386 -hda "${SYSTEM_IMAGE}"
}

platform_setup() {
    qemu-system-i386 -hda "${SYSTEM_IMAGE}" -cdrom "${SETUP_IMAGE}"
}

platform_dist() {
    qemu-system-i386 -hda "${SYSTEM_IMAGE}" -fda "${DIST_IMAGE}"
}

platform_distboot() {
    qemu-system-i386 -fda "${DIST_IMAGE}" -boot order=a
}

platform_install() {
    qemu-system-i386 -hda "${SYSTEM_IMAGE}" -cdrom "${INSTALL_IMAGE}" -boot order=d
}
