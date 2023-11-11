#!/bin/sh
set -e
set -x

package=tiff-3.9.1

PATH=/usr/local/bin:$PATH
export PATH

. preamble.inc

config_libs="-L/usr/local/lib -lmp"
config_options="--enable-static=yes --enable-shared=yes"
#config_options="--enable-static=yes --enable-shared=yes --disable-cxx"

if [ ! -f .patched ]; then
	patch -p1 -i $patches/$package.patch
	touch .patched
fi

CONFIG_SHELL=/usr/local/bin/bash
export CONFIG_SHELL

ACCEPT_INFERIOR_RM_PROGRAM=yes
export ACCEPT_INFERIOR_RM_PROGRAM

prefixvar=DESTDIR
pkgdestrootbased=1

# to build dynamic libs
libtoolize
#automake --add-missing
autoreconf -i

. $incdir/build.inc

unset CONFIG_SHELL

