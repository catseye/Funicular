#!/bin/sh

TOOLSHELF_VERSION=0.1-2014.0818

cd /home/user
mkdir -p toolshelf
mkdir -p toolshelf/.bin
mkdir -p toolshelf/localhost/distfile

if [ ! -d toolshelf/.toolshelf ]; then
  unzip /cdrom/$TOOLSHELF_VERSION.zip || exit 1
  mv toolshelf-$TOOLSHELF_VERSION toolshelf/.toolshelf || exit 1
fi

cd toolshelf/localhost/distfile
if [ ! -e /home/user/toolshelf/localhost/distfile/Python-2.7.6/bin/python ]; then
  echo "About to extract and build Python.  This may take a while."
  echo "Press Enter to continue."
  read LINE
  tar zxvf /cdrom/Python-2.7.6.tgz || exit 1
  cd Python-2.7.6
  ( ./configure --prefix=`pwd` && make && make install ) || exit 1
fi

cd /home/user
rm -f toolshelf/.bin/python
ln -s /home/user/toolshelf/localhost/distfile/Python-2.7.6/bin/python toolshelf/.bin/python

echo >>.profile 'export TOOLSHELF=/home/user/toolshelf && . $TOOLSHELF/.toolshelf/init.sh'
echo >>.profile 'alias th=toolshelf'

if [ -e /cdrom/local-cookies.catalog -a ! -e toolshelf/.toolshelf/local-cookies.catalog ]; then
  cp /cdrom/local-cookies.catalog toolshelf/.toolshelf/local-cookies.catalog
fi
