#!/bin/sh
set -e
set -x

package=jpeg-6b

tarball_prefix=jpegsrc.v6b.tar

. preamble.inc

#cp $codefragments/strcasecmp.c src/lib/

config_options="--enable-static --enable-shared"

#if [ ! -f .patched ]; then
#	patch -p1 -i $patches/$package.patch
#	touch .patched
#fi

CONFIG_SHELL=/usr/local/bin/bash
export CONFIG_SHELL

. $incdir/build.inc

unset CONFIG_SHELL

