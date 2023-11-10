#!/bin/sh
set -e
set -x

package=libpng-1.6.34

PATH=/usr/local/bin:$PATH
export PATH

. preamble.inc

if [ ! -f .patched ]; then
        patch -p1 -i $patches/$package.patch
        touch .patched
fi

config_options="--enable-mips-msa=no --enable-powerpc-vsx=no"
config_libs="-L/usr/local/lib"

ACCEPT_INFERIOR_RM_PROGRAM=yes
export ACCEPT_INFERIOR_RM_PROGRAM

CONFIG_SHELL=/usr/local/bin/bash
export CONFIG_SHELL

configure_cmd="bash configure"

prefixvar=DESTDIR
pkgdestrootbased=1

# redo libtool for shared libs
libtoolize
autoreconf
# intermittent config script time detection issue... reset the file dates?
# touch 1110150023 *

. $incdir/build.inc

unset CONFIG_SHELL
unset ACCEPT_INFERIOR_RM_PROGRAM

