#!/bin/bash

CURL_PREFIX=/mingw32
SSL_PREFIX=/usr/local
RELEASE=cpuminer-opt-v3.8.10-bf-win32

# gcc 4.4
extracflags="-D_REENTRANT -fmerge-all-constants -funroll-loops -fomit-frame-pointer" # -fvariable-expansion-in-unroller -fbranch-target-load-optimize2 -fsched2-use-superblocks -falign-loops=16 -falign-functions=16 -falign-jumps=16 -falign-labels=16"

# gcc 4.8+
extracflags="$extracflags -Ofast -fuse-linker-plugin -ftree-loop-if-convert-stores" # -flto "

# extracflags="-pg -static -fno-inline-small-functions"
extracflags="-DCURL_STATICLIB -DOPENSSL_NO_ASM -DUSE_ASM $extracflags"
CPPFLAGS="-I$CURL_PREFIX/include -I$SSL_PREFIX/include"

F="--with-curl=$CURL_PREFIX --with-crypto=$SSL_PREFIX --host=i686-w64-mingw32"

mkdir $RELEASE
cp README.txt $RELEASE/
cp /mingw32/bin/libcurl-4.dll $RELEASE/
cp /mingw32/bin/libeay32.dll $RELEASE/
cp /mingw32/bin/libgcc_s_dw2-1.dll $RELEASE/
cp /mingw32/bin/libgmp-10.dll $RELEASE/
cp /mingw32/bin/libjansson-4.dll $RELEASE/
cp /mingw32/bin/libstdc++-6.dll $RELEASE/
cp /mingw32/bin/libwinpthread-1.dll $RELEASE/
cp /mingw32/bin/pthreadGC2.dll $RELEASE/
cp /mingw32/bin/ssleay32.dll $RELEASE/
cp /mingw32/bin/zlib1.dll $RELEASE/
cp /usr/local/bin/libcrypto-1_1.dll $RELEASE/
cp /usr/local/bin/libssl-1_1.dll $RELEASE/

make clean || echo clean
rm -f config.status
CFLAGS="-O3 -msse2 -Wall $extracflags" ./configure $F
make
strip -s cpuminer.exe
mv cpuminer.exe $RELEASE/cpuminer-sse2.exe
make clean || echo clean
