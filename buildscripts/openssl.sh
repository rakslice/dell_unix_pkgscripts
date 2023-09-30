#!/bin/sh
set -e
set -x

package=openssl-1.0.2o

PATH=/usr/local/bin:$PATH
export PATH

. preamble.inc

cp $codefragments/strcasecmp.c .

if [ ! -f .patched ]; then
	patch -p1 -i $patches/$package.patch
	touch .patched
fi

configure_cmd="./Configure"

#config_options="BSD-x86 no-threads no-asm no-shared no-dso no-hw-padlock"
config_options="-lsocket -lnsl BSD-x86 no-threads no-asm no-shared no-dso no-hw-padlock"

CONFIG_SHELL=/usr/local/bin/bash
export CONFIG_SHELL

. $incdir/build.inc

unset CONFIG_SHELL

