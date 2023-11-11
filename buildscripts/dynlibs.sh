#!/bin/sh
set -e
set -x

if false; then
  true
fi

# I worked on this stuff with gcc-3.4.6 installed; it may be required

sh m4-1.4.10.sh
sh autoconf.sh
sh bash-3.sh
sh perl-5.8.9.sh
sh automake-1.16.sh
sh libtool-2.4.7.sh

sh pkgconfig-0.18.1.sh

# rebuild with shared libs
sh zlib.sh
sh libpng-1.6.34.sh
sh freetype.sh
sh jpeg-9e.sh
sh imlib.sh
