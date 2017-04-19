#!/bin/sh

. /home/user/.shelf/shelf.sh

shelf_populate() {
    src_dir="$1"
    while read -r line; do
        project=`echo $line | awk '{split($0,a,"@"); print a[1]}'`
        tag=`echo $line | awk '{split($0,a,"@"); print a[2]}'`
        if [ -e "$src_dir/$project.tar.gz" ]; then
            tar zxvf $src_dir/$project.tar.gz
        elif [ -e "$src_dir/$project.tgz" ]; then
            tar zxvf $src_dir/$project.tgz
        fi
        #shelf_build $project
        #shelf_link $project
    done
}

cd /home/user
mkdir -p catseye
cd catseye

shelf_populate /cdrom/ < /cdrom/infrastructure.catalog || exit 1
shelf_populate /cdrom/ < /cdrom/catseye.catalog || exit 1
