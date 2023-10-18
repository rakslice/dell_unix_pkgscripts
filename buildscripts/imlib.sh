#!/bin/sh
set -e
set -x

package=imlib2-1.4.4

PATH=/usr/local/bin:/usr/dell/gcc-2/bin:$PATH
export PATH

. preamble.inc

cp $codefragments/strcasecmp.c src/lib/

config_libs="-lm -lz -ljpeg -ltiff"
config_options="--disable-mmx PNG_LIBS=-lpng16 PNG_CFLAGS=-I/usr/local/include/libpng16"

if [ ! -f .patched ]; then
	patch -p1 -i $patches/$package.patch
	touch .patched
fi

CONFIG_SHELL=/usr/local/bin/bash
export CONFIG_SHELL

configure_cmd="bash configure"

prefixvar=DESTDIR
pkgdestrootbased=1

. $incdir/build.inc

unset CONFIG_SHELL

