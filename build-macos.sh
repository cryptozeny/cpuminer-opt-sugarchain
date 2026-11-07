#!/bin/zsh
# Minimal macOS/arm64 build of cpuminer-opt-sugarchain: only the yespower family, no x86 assembly.
# Usage: ./build-macos.sh
set -e
cd "$(dirname "$0")"

BREW=/opt/homebrew
# A fresh clone has no configure output: generate it once.
if [ ! -f cpuminer-config.h ]; then
  ./autogen.sh >/dev/null 2>&1 || true
  CPPFLAGS="-Icompat-arm -I$BREW/opt/openssl@3/include -I$BREW/opt/gmp/include" \
  LDFLAGS="-L$BREW/opt/openssl@3/lib -L$BREW/opt/gmp/lib" \
  ./configure --disable-assembly --with-crypto=$BREW/opt/openssl@3 >/dev/null
fi
CFLAGS=(-O3 -std=gnu11 -DHAVE_CONFIG_H -DNOASM -DYESPOWER_ONLY -I. -Icompat-arm -Icompat/jansson
        -I$BREW/include -Wno-implicit-function-declaration -Wno-int-conversion
        -Wno-incompatible-pointer-types -Wno-deprecated-declarations -w)

SOURCES=(cpu-miner.c util.c api.c sysinfos.c algo-gate-api.c uint256.cpp
         algo/yespower/yespower.c algo/yespower/sha256.c algo/yespower/yespower-opt.c
         algo/sha/sha2.c)

# The miner links jansson, which the top-level make builds first; build the static library here instead.
if [ ! -f compat/jansson/libjansson.a ]; then
  mkdir -p build-macos/jansson
  for f in compat/jansson/*.c; do
    clang -O2 -std=gnu11 -Icompat/jansson -c "$f" -o "build-macos/jansson/$(basename "$f" .c).o" || exit 1
  done
  ar crs compat/jansson/libjansson.a build-macos/jansson/*.o
fi

mkdir -p build-macos
objs=()
i=0
for src in $SOURCES; do
  i=$((i+1))
  obj=build-macos/part$i.o
  case $src in
    *.cpp) clang++ "${CFLAGS[@]/-std=gnu11/-std=gnu++11}" -c $src -o $obj ;;
    *) clang "${CFLAGS[@]}" -c $src -o $obj ;;
  esac
  objs+=($obj)
done

clang++ "${objs[@]}" compat/jansson/libjansson.a \
  -L$BREW/lib -L$BREW/opt/openssl@3/lib -lssl -lcrypto -lgmp -lcurl \
  -o cpuminer-macos
echo "built: $(pwd)/cpuminer-macos"
