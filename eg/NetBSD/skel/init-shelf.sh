#!/bin/sh

cd /home/user
mkdir -p .local

if [ ! -d shelf ]; then
  unzip /cdrom/shelf.zip || exit 1
  #cp -Rp /cdrom/shelf_cookies shelf_cookies
fi

cat >>.profile <<EOF
. $HOME/shelf/shelf.sh
export SHELF_FARMBASE=$HOME/.local
export SHELF_PATH=$HOME/catseye
#export SHELF_COOKIES=$HOME/shelf_cookies
shelf_init
EOF
