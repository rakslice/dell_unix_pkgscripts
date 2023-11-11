#!/bin/sh
set -e
set -x

package=freetype-2.3.9

PATH=/usr/local/bin:$PATH
export PATH

. preamble.inc

if [ ! -f .patched ]; then
	patch -p1 -i $patches/$package.patch
	touch .patched
fi

CONFIG_SHELL=/usr/local/bin/bash
export CONFIG_SHELL

prefixvar=DESTDIR
pkgdestrootbased=1

# for dynamic libraries build
cd builds/unix
libtoolize
autoreconf
cd ../..

# It seems like every build that depends on -lz libtool has
# trouble finding it without -L despite being in the -rpath
# In this case it needs to go in the link command line in unix-cc.in
# rather than via configure options

. $incdir/build.inc

unset CONFIG_SHELL

