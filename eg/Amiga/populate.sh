cp -Rp skel/* dh0/

mkdir -p dh0/c
mkdir -p dh0/devs
mkdir -p dh0/fonts
mkdir -p dh0/l
mkdir -p dh0/libs
mkdir -p dh0/s

if [ -e dh0/s/Startup-Sequence ]; then
    cp dh0/s/Startup-Sequence.Gondola dh0/s/Startup-Sequence
fi

mkdir -p dh0/Distributions
cp -p skel/icons/Drawer.info dh0/Distributions.info

mkdir -p dh0/Empty
cp -p skel/icons/Drawer.info dh0/Empty.info

mkdir -p dh0/Extras
cp -p skel/icons/Drawer.info dh0/Extras.info

### extract the simple and cromulent archives ###
ARCHIVES="
  FastFonts
  Conman CLImax
  muchmore who
  Xicon noiconpos icontype
  smalllib FixFd
  ArpRequest
"
for ARCHIVE in $ARCHIVES; do
    lha xfw=dh0/Distributions distfiles/${ARCHIVE}.lha
done

### Now the stronger stuff ###

### DICE 3.15 ###
lha xfw=dh0/Distributions distfiles/dice-3.15.lha
chmod 755 dh0/Distributions/dice-rel-3.15/abin/*
# for lack of a better place to put this
cp dh0/Distributions/SmallLib/small.lib dh0/Distributions/dice-rel-3.15/dlib/

### vbcc_target_m68k-amiga.lha (...just for amigas.lib...) ###
lha xfw=dh0/Distributions distfiles/vbcc_target_m68k-amiga.lha
cp dh0/Distributions/vbcc_target_m68k-amigaos/targets/m68k-amigaos/lib/amigas.lib dh0/Distributions/dice-rel-3.15/dlib/
# can't stand the ugly...
rm dh0/Distributions/vbcc_target_m68k-amigaos.info
mv dh0/Distributions/vbcc_target_m68k-amigaos dh0/Distributions/m68k-amigaos

### A68k ###
lha xfw=dh0/Distributions/A68k distfiles/A68kGibbs.lha

### Blink ###
lha xfw=dh0/Distributions/Blink distfiles/blink67.lzh

### PCQ 1.2b ###
lha xfw=dh0/Distributions/PCQ-1.2b distfiles/pcq12b.lzh

### Draco ###
lha xfw=dh0/Distributions distfiles/Draco.lha
chmod 755 dh0/Distributions/Draco/c/*

### Drawer icons in Distributions ###
for DIR in dh0/Distributions/*; do
  if [ -d $DIR ]; then
    cp -p skel/icons/Drawer.info ${DIR}.info
  fi
done

### Gondola:c ###

cp dh0/Distributions/Xicon/Xicon dh0/c/
cp dh0/Distributions/MuchMore/MuchMore dh0/c/   # version 3.6
cp dh0/Distributions/MuchMore/MuchMore dh0/c/Less
cp dh0/Distributions/MuchMore/MuchMore dh0/c/More   # TODO: use Replex?
cp dh0/Distributions/NoIconPos/noIconPos dh0/c/
cp dh0/Distributions/A68k/A68k dh0/c/
cp dh0/Distributions/Blink/Blink dh0/c/
cp dh0/Distributions/PCQ-1.2b/Pascal dh0/c/
cp dh0/Distributions/PCQ-1.2b/Peep dh0/c/
cp dh0/Distributions/Conman/ConMan dh0/c/
cp dh0/Distributions/Conman/SetCMan dh0/c/
cp dh0/Distributions/Conman/History dh0/c/
cp dh0/Distributions/CLImax/CLImax dh0/c/
cp dh0/Distributions/FixFd/FixFD dh0/c/
cp dh0/Distributions/FastFonts/FastFonts dh0/c/
cp dh0/Distributions/Who/Who dh0/c/

chmod 755 dh0/c/*

### Gondola:l ###
cp dh0/Distributions/Conman/ConHandler dh0/l/

### Gondola:s ###
# just some tweaks to PCQ-1.2b's Make scripts
cat >dh0/s/PCQMake <<EOF
.key source
pascal <source>.p t:<source>.asm
a68k t:<source>.asm t:<source>.o
delete t:<source>.asm
blink t:<source>.o to <source> library PCQ:PCQ.lib
delete t:<source>.o
EOF

cat >dh0/s/PCQOMake <<EOF
.key source
Pascal <source>.p t:<source>.asm
Peep t:<source>.asm t:<source>.s
delete t:<source>.asm
a68k t:<source>.s t:<source>.o
delete t:<source>.s
blink t:<source>.o to <source> library PCQ:PCQ.lib
delete t:<source>.o
EOF

### Gondola:libs ###
cp dh0/Distributions/Conman/conhandler.library dh0/libs/
cp dh0/Distributions/ArpRequest/arp.library dh0/libs/      # ver 39.1
