#!/bin/sh
set -e
set -x

package=automake-1.10.3

PATH=/usr/local/bin:$PATH
export PATH

. preamble.inc

#cp $codefragments/strcasecmp.c .

if false; then
if [ ! -f .patched ]; then
	patch -p1 -i $patches/$package.patch
	touch .patched
fi
fi

configure_cmd="bash configure"

config_options=""

prefixvar=DESTDIR
pkgdestrootbased=1

CONFIG_SHELL=/usr/local/bin/bash
export CONFIG_SHELL

. $incdir/build.inc

unset CONFIG_SHELL

