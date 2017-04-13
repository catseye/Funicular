#!/bin/sh

. /home/user/.shelf/shelf.sh

cd /home/user
mkdir -p catseye
cd catseye

for PROJECT in "
  make-3.81
  nano-2.2.6
  mercurial-1.9.3
  perl-5.18.2
  hugs98-plus-Sep2006
  otp_src_R16B03-1
  chicken-4.8.0.5
  yasm-1.2.0
"; do
    tar zxvf /cdrom/$PROJECT.tar.gz
    shelf_build $PROJECT
done

# extract_project: echo $line | awk '{split($0,a,"@"); print a[1]}'
# extract_tag: echo $line | awk '{split($0,a,"@"); print a[2]}'
