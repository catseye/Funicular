#!/bin/sh

. /home/user/.shelf/shelf.sh

cd /home/user/catseye

shelf_build make-3.8.1
shelf_build nano-2.2.6
shelf_build Python-2.7.6
shelf_build yasm-1.2.0

# shelf_build chicken-4.8.0.5
#( cd perl-5.18.2 && C_INCLUDE_PATH="" ./Configure -des -Dprefix=`pwd`/install && C_INCLUDE_PATH="" make && make install ) || exit 1
# shelf_build  hugs98-plus-Sep2006
# shelf_build  otp_src_R16B03-1
