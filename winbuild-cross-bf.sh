#!/bin/bash

CURL_PREFIX=/mingw64
SSL_PREFIX=/usr/local

# gcc 4.4
extracflags="-D_REENTRANT -fmerge-all-constants -funroll-loops -fomit-frame-pointer" # -fvariable-expansion-in-unroller -fbranch-target-load-optimize2 -fsched2-use-superblocks -falign-loops=16 -falign-functions=16 -falign-jumps=16 -falign-labels=16"

# gcc 4.8+
extracflags="$extracflags -Ofast -fuse-linker-plugin -ftree-loop-if-convert-stores" # -flto "

# extracflags="-pg -static -fno-inline-small-functions"
extracflags="-DCURL_STATICLIB -DOPENSSL_NO_ASM -DUSE_ASM $extracflags"
CPPFLAGS="-I$CURL_PREFIX/include -I$SSL_PREFIX/include"

F="--with-curl=$CURL_PREFIX --with-crypto=$SSL_PREFIX --host=x86_64-w64-mingw32"

mkdir release
cp README.txt release/
cp /mingw64/bin/libcurl-4.dll release/
cp /mingw64/bin/libgcc_s_seh-1.dll release/
cp /mingw64/bin/libgmp-10.dll release/
cp /mingw64/bin/libjansson-4.dll release/
cp /mingw64/bin/libstdc++-6.dll release/
cp /mingw64/bin/libwinpthread-1.dll release/
cp /mingw64/bin/zlib1.dll release/
cp /usr/local/bin/libcrypto-1_1-x64.dll release/
cp /usr/local/bin/libssl-1_1-x64.dll release/

make clean || echo clean
rm -f config.status
CFLAGS="-O3 -msse2 -Wall $extracflags" ./configure $F
make
strip -s cpuminer.exe
mv cpuminer.exe release/cpuminer-sse2.exe
make clean || echo clean

make distclean || echo clean
rm -f config.status
./autogen.sh || echo done
CFLAGS="-O3 -march=core-avx2 -msha -Wall $extracflags" ./configure $F
make 
strip -s cpuminer.exe
mv cpuminer.exe release/cpuminer-avx2-sha.exe

#make clean || echo clean
#CFLAGS="-O3 -march=corei7-avx -msha -Wall $extracflags" ./configure $F
#make
#strip -s cpuminer.exe
#mv cpuminer.exe release/cpuminer-avx-sha.exe

make clean || echo clean
rm -f config.status
CFLAGS="-O3 -march=core-avx2 -Wall $extracflags" ./configure $F
make 
strip -s cpuminer.exe
mv cpuminer.exe release/cpuminer-avx2.exe

#make clean || echo clean
#rm -f config.status
#CFLAGS="-O3 -march=znver1 -Wall $extracflags" ./configure $F
#make -j 
#strip -s cpuminer.exe
#mv cpuminer.exe release/cpuminer-aes-sha.exe


make clean || echo clean
rm -f config.status
CFLAGS="-O3 -march=corei7-avx -Wall $extracflags" ./configure $F
make 
strip -s cpuminer.exe
mv cpuminer.exe release/cpuminer-avx.exe

# -march=westmere is supported in gcc5
make clean || echo clean
rm -f config.status
CFLAGS="-O3 -march=westmere -Wall $extracflags" ./configure $F
#CFLAGS="-O3 -maes -msse4.2 -Wall $extracflags" ./configure $F
make 
strip -s cpuminer.exe
mv cpuminer.exe release/cpuminer-aes-sse42.exe

#make clean || echo clean
#rm -f config.status
#CFLAGS="-O3 -march=corei7 -Wall $extracflags" ./configure $F
#make 
#strip -s cpuminer.exe
#mv cpuminer.exe release/cpuminer-sse42.exe

#make clean || echo clean
#rm -f config.status
#CFLAGS="-O3 -march=core2 -Wall $extracflags" ./configure $F
#make 
#strip -s cpuminer.exe
#mv cpuminer.exe release/cpuminer-ssse3.exe
#make clean || echo clean

