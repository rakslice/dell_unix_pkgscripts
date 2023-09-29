#!/bin/sh
set -e
set -x

package=binutils-2.9.1

. preamble.inc

#cp $codefragments/strcasecmp.c src/lib/

#config_libs="-lm -lz -ljpeg -ltiff"
#config_options="--disable-nls --enable-languages=c,c++"

#if [ ! -f .patched ]; then
#	patch -p1 -i $patches/$package.patch
#	touch .patched
#fi

cd ..
if [ ! -d build-binutils ]; then
	mkdir build-binutils
fi
cd build-binutils

configure_cmd=../$package/configure

CONFIG_SHELL=/usr/local/bin/bash
export CONFIG_SHELL

PATH=/usr/local/bin:/usr/dell/gcc-2/bin:$PATH
export PATH

. $incdir/build.inc

unset CONFIG_SHELL

