#!/bin/sh

. /home/user/.shelf/shelf.sh

cd /home/user/catseye

# write out cookies

cat >perl-5.18.2/build.sh <<EOF
#!/bin/sh
C_INCLUDE_PATH="" ./Configure -des -Dprefix=`pwd`/install && C_INCLUDE_PATH="" make && make install
EOF
chmod 755 perl-5.18.2/build.sh

cat >chicken-4.8.0.5/build.sh <<EOF
#!/bin/sh
mkdir -p install && make PLATFORM=bsd PREFIX=`pwd`/install VARDIR=`pwd`/install install
EOF
chmod 755 chicken-4.8.0.5/build.sh

#cat >hugs98-plus-Sep2006/build.sh <<EOF
##!/bin/sh
#EOF
#chmod 755 hugs98-plus-Sep2006/build.sh

cat >otp_src_R16B03-1/build.sh <<EOF
#!/bin/sh
rm -rf lib/cos* && touch lib/asn1/SKIP lib/eldap/SKIP lib/gs/SKIP lib/hipe/SKIP lib/inets/SKIP lib/jinterface/SKIP lib/megaco/SKIP lib/orber/SKIP lib/odbc/SKIP lib/erlang && ./configure --prefix=`pwd` --disable-threads --disable-hipe --without-ssl && make
EOF
chmod 755 otp_src_R16B03-1/build.sh

PROJECTS="
    make-3.81
    nano-2.2.6
    Python-2.7.6
    yasm-1.2.0
    perl-5.18.2
    chicken-4.8.0.5
    hugs98-plus-Sep2006
    otp_src_R16B03-1"

for p in $PROJECTS; do
  echo "*** shelf_build $p ***"
  shelf_build $p
  echo "*** shelf_link $p ***"
  shelf_link $p
done
