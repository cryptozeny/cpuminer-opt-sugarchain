#!/bin/bash

make distclean || echo clean
rm -f config.status

./autogen.sh || echo done

YESPOWER="-Wall -O2 -fomit-frame-pointer"
SSE2="-msse2"

# CFLAGS="-O3 -march=native -Wall" ./configure --with-curl
CFLAGS="$YESPOWER $SSE2" ./configure --with-curl

make -j$(nproc)

strip -s cpuminer