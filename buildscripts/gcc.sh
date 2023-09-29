#!/bin/sh
set -e
set -x

package=gcc-2.95.3

. preamble.inc

#cp $codefragments/strcasecmp.c src/lib/

#config_libs="-lm -lz -ljpeg -ltiff"
config_options="--disable-nls --enable-languages=c,c++"

#if [ ! -f .patched ]; then
#	patch -p1 -i $patches/$package.patch
#	touch .patched
#fi

cd ..
if [ -d build-gcc ]; then
	mkdir build-gcc
fi
cd build-gcc

CONFIG_SHELL=/usr/local/bin/bash
export CONFIG_SHELL

. $incdir/build.inc

unset CONFIG_SHELL

