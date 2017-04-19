#!/bin/sh

. /home/user/.shelf/shelf.sh

shelf_populate() {
    src_dir="$1"
    while read -r line; do
        project=`echo $line | awk '{split($0,a,"@"); print a[1]}'`
        tag=`echo $line | awk '{split($0,a,"@"); print a[2]}'`
        tar zxvf $src_dir/$project.tar.gz
        #if [ "X$tag" != X ]; then
        #    cd $project && git checkout $tag && cd ..
        #fi
        #shelf_build $project
        #shelf_link $project
    done
}

cd /home/user
mkdir -p catseye
cd catseye

shelf_populate /cdrom/ < /cdrom/infrastructure.catalog || exit 1
shelf_populate /cdrom/ < /cdrom/catseye.catalog || exit 1

( cd make-3.81 && ./configure --prefix=`pwd` && make && make install ) || exit 1
( cd nano-2.2.6 && ./configure --prefix=`pwd` && make && make install ) || exit 1
( cd Python-2.7.6 && ./configure --prefix=`pwd` && make && make install ) || exit 1
( cd perl-5.18.2 && C_INCLUDE_PATH="" ./Configure -des -Dprefix=`pwd`/install && C_INCLUDE_PATH="" make && make install ) || exit 1

# shelf_build  hugs98-plus-Sep2006
# shelf_build  otp_src_R16B03-1
# shelf_build  chicken-4.8.0.5
# shelf_build  yasm-1.2.0
