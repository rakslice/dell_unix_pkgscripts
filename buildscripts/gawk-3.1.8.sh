#!/bin/sh
set -e
set -x

package=gawk-3.1.8

PATH=/usr/local/bin:$PATH
export PATH

. preamble.inc

if [ ! -f .patched ]; then
        patch -p1 -i $patches/$package.patch
        touch .patched
fi

CONFIG_SHELL=/usr/local/bin/bash
export CONFIG_SHELL

configure_cmd="bash configure"
configure_once=1

prefixvar=DESTDIR
pkgdestrootbased=1

. $incdir/build.inc

unset CONFIG_SHELL
unset SHELL

