#!/bin/sh
set -e
set -x

package=tiff-3.9.1

PATH=/usr/local/bin:$PATH
export PATH

. preamble.inc

config_libs="-lmp"
config_options="--enable-static=yes --enable-shared=yes"

if [ ! -f .patched ]; then
	patch -p1 -i $patches/$package.patch
	touch .patched
fi

CONFIG_SHELL=/usr/local/bin/bash
export CONFIG_SHELL

prefixvar=DESTDIR
pkgdestrootbased=1

. $incdir/build.inc

unset CONFIG_SHELL

