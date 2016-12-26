# i386 w/ QEMU 1.6.2 w/ certain options

DISTFILE_URL='http://wiki.qemu-project.org/download/qemu-1.6.2.tar.bz2'

platform_initsys() {
    if [ "x$IMAGE_SIZE" = x ]; then
        IMAGE_SIZE=1024
        echo "IMAGE_SIZE not set, defaulting to $IMAGE_SIZE megabytes"
    fi
    dd if=/dev/zero of="$1" bs=1M count=${IMAGE_SIZE}
}

platform_initsetup() {
    echo "Creating ISO image '$1'..."
    echo genisoimage -R -J -D -joliet-long -o "$1" staging_area
    genisoimage -R -J -D -joliet-long -o "$1" staging_area
}

platform_initdist() {
    if [ "x$IMAGE_SIZE" = x ]; then
        IMAGE_SIZE=1440
        echo "IMAGE_SIZE not set, defaulting to $IMAGE_SIZE kilobytes"
    fi

    #-- TODO: this is a little restrictive
    case $IMAGE_SIZE in
        360|720|1440)
            dd if=/dev/zero of="$1" bs=1K count=${IMAGE_SIZE}
            ;;
        *)
            echo "Only supported sizes: 360, 720 and 1440"
            exit 1
    esac
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
