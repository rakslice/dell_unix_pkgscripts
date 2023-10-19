#!/bin/sh
set -e
set -x

package=openssl-1.0.2o

PATH=/usr/local/bin:$PATH
export PATH

use_old_tar=1 # archive end error workaround

. preamble.inc

cp $codefragments/strcasecmp.c .

if [ ! -f .patched ]; then
	patch -p1 -i $patches/$package.patch
	touch .patched
fi

configure_cmd="./Configure"

config_options="-lsocket -lnsl BSD-x86 no-threads no-asm no-shared no-dso no-hw-padlock"

CONFIG_SHELL=/usr/local/bin/bash
export CONFIG_SHELL

prefixvar=INSTALL_PREFIX
pkgdestrootbased=1

. $incdir/build.inc

unset CONFIG_SHELL

