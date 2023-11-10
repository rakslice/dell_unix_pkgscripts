#!/bin/sh
set -e
set -x

if false; then
  true
fi

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
sh imlib.sh
