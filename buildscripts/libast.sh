#!/bin/sh
set -e
set -x

package=libast-0.7

PATH=/usr/local/bin:$PATH
export PATH

. preamble.inc

if [ ! -f .patched ]; then
	patch -p2 -i $patches/$package.patch
	touch .patched
fi

CONFIG_SHELL=/usr/local/bin/bash
export CONFIG_SHELL

ACCEPT_INFERIOR_RM_PROGRAM=yes
export ACCEPT_INFERIOR_RM_PROGRAM

prefixvar=DESTDIR
pkgdestrootbased=1

# for dynamic library builds
libtoolize
autoreconf -i

. $incdir/build.inc

unset CONFIG_SHELL

