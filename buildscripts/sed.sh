#!/bin/sh
set -e
set -x

package=sed-4.0.9

PATH=/usr/local/bin:/usr/dell/gcc-2/bin:$PATH
export PATH

. preamble.inc

if [ ! -f .patched ]; then
	patch -p1 -i $patches/$package.patch
	touch .patched
fi

CONFIG_SHELL=/usr/local/bin/bash
export CONFIG_SHELL

SHELL=/usr/local/bin/bash
export SHELL

configure_cmd="bash configure"

prefixvar=DESTDIR
pkgdestrootbased=1

. $incdir/build.inc

unset CONFIG_SHELL
unset SHELL
