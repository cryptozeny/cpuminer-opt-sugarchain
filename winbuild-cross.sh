#!/bin/bash

# LOCAL_LIB="$HOME/usr/lib"
LOCAL_LIB="$PWD/depends"

# export LDFLAGS="-L$LOCAL_LIB/curl/lib/.libs -L$LOCAL_LIB/gmp/.libs -L$LOCAL_LIB/openssl"
export LDFLAGS="-L$LOCAL_LIB/zlib-1.2.11 -L$LOCAL_LIB/curl-7.47.0/lib/.libs -L$LOCAL_LIB/gmp-6.1.0/.libs -L$LOCAL_LIB/openssl-1.0.2g"
COMMON_PATH="-I$LOCAL_LIB"
GMP_PATH="-I$LOCAL_LIB/gmp"
DLL_PATH="-I$LOCAL_LIB/dll"

# F="--with-curl=$LOCAL_LIB/curl --with-crypto=$LOCAL_LIB/openssl --host=x86_64-w64-mingw32"
F="--with-curl=$LOCAL_LIB/curl-7.47.0 --with-crypto=$LOCAL_LIB/openssl-1.0.2g --host=x86_64-w64-mingw32"

sed -i 's#"-lpthread"#"-lpthreadGC2"#g' configure.ac

YESPOWER="-Wall -O2 -fomit-frame-pointer"
SSE2="-msse2"

mkdir release
cp README.txt release/
# cp /usr/x86_64-w64-mingw32/lib/zlib1.dll release/
cp $LOCAL_LIB/dll/zlib1.dll release/
cp /usr/x86_64-w64-mingw32/lib/libwinpthread-1.dll release/
cp /usr/lib/gcc/x86_64-w64-mingw32/5.3-win32/libstdc++-6.dll release/
cp /usr/lib/gcc/x86_64-w64-mingw32/5.3-win32/libgcc_s_seh-1.dll release/
cp $LOCAL_LIB/dll/libcrypto-1_1-x64.dll release/
cp $LOCAL_LIB/dll/libcurl-4.dll release/
cp $LOCAL_LIB/dll/libeay32.dll release/

make distclean || echo clean
rm -f config.status
./autogen.sh || echo done
# CFLAGS="-O3 -march=core-avx2 -msha -Wall" ./configure $F
CFLAGS="$YESPOWER $SSE2 $COMMON_PATH $GMP_PATH $DLL_PATH" ./configure $F
make -j$(nproc)
strip -s cpuminer.exe
mv cpuminer.exe release/cpuminer.exe

# make distclean || echo clean
# rm -f config.status
# ./autogen.sh || echo done
# CFLAGS="-O3 -march=core-avx2 -msha -Wall" ./configure $F
# make -j$(nproc)
# strip -s cpuminer.exe
# mv cpuminer.exe release/cpuminer-avx2-sha.exe
# 
# make clean || echo clean
# rm -f config.status
# CFLAGS="-O3 -march=core-avx2 -Wall" ./configure $F 
# make -j$(nproc)
# strip -s cpuminer.exe
# mv cpuminer.exe release/cpuminer-avx2.exe
# 
# make clean || echo clean
# rm -f config.status
# CFLAGS="-O3 -march=corei7-avx -Wall" ./configure $F 
# make -j$(nproc)
# strip -s cpuminer.exe
# mv cpuminer.exe release/cpuminer-avx.exe
# 
# # -march=westmere is supported in gcc5
# make clean || echo clean
# rm -f config.status
# CFLAGS="-O3 -march=westmere -Wall" ./configure $F
# #CFLAGS="-O3 -maes -msse4.2 -Wall" ./configure $F
# make -j$(nproc)
# strip -s cpuminer.exe
# mv cpuminer.exe release/cpuminer-aes-sse42.exe
# 
# make clean || echo clean
# rm -f config.status
# CFLAGS="-O3 -msse2 -Wall" ./configure $F
# make -j$(nproc)
# strip -s cpuminer.exe
# mv cpuminer.exe release/cpuminer-sse2.exe
# make clean || echo clean

# RESTORE after build
git checkout -- configure.ac
git checkout -- configure