#!/bin/sh

cd /home/user
mkdir -p .local/bin
mkdir -p catseye

if [ ! -d shelf ]; then
  tar zxvf /cdrom/shelf.tar.gz || exit 1
  mv shelf .shelf
fi

cat >>.profile <<EOF
. $HOME/.shelf/shelf.sh
export SHELF_FARMBASE=$HOME/.local
export SHELF_PATH=$HOME/catseye
shelf_init
EOF
