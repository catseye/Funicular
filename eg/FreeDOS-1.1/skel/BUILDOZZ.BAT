GCC -c action.c -o action.o
GCC -c avl.c -o avl.o
GCC -c defopen.c -o defopen.o
GCC -c dumpnet.c -o dumpnet.o
GCC -c err.c -o err.o
GCC -c interfac.c -o interfac.o
GCC -c kernel.c -o kernel.o
GCC -c lazy.c -o lazy.o
GCC -c list.c -o list.o
GCC -c param.c -o param.o
GCC -c parse.c -o parse.o
GCC -c printz.c -o printz.o
GCC -c rule.c -o rule.o
GCC -c scope.c -o scope.o
GCC -c source.c -o source.o
GCC -c sys.c -o sys.o
GCC -c table.c -o table.o
GCC -DVERSION='"1.0.4-4ce3"' -c util.c -o util.o
GCC -c zkernel.c -o zkernel.o
GCC -c zlex.c -o zlex.o
GCC -c zsys.c -o zsys.o
GCC -DVERSION='"1.0.4-4ce3"' -c zz.c -o zz.o
GCC -c zzi.c -o zzi.o
GCC *.o -o ozz.exe
