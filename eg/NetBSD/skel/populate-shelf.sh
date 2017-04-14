#!/bin/sh

. /home/user/.shelf/shelf.sh

cd /home/user
mkdir -p catseye
cd catseye

while read -r line; do
    PROJECT=`echo $line | awk '{split($0,a,"@"); print a[1]}'`
    TAG=`echo $line | awk '{split($0,a,"@"); print a[2]}'`
    tar zxvf /cdrom/$PROJECT.tar.gz
    if [ "X$TAG" != X ]; then
        cd $PROJECT
        git checkout $TAG
        cd ..
    fi
    shelf_build $PROJECT
done < /cdrom/infrastructure.catalog

while read -r line; do
    PROJECT=`echo $line | awk '{split($0,a,"@"); print a[1]}'`
    TAG=`echo $line | awk '{split($0,a,"@"); print a[2]}'`
    tar zxvf /cdrom/$PROJECT.tar.gz
    if [ "X$TAG" != X ]; then
        cd $PROJECT
        git checkout $TAG
        cd ..
    fi
    shelf_build $PROJECT
done < /cdrom/catseye.catalog
