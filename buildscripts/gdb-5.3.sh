#!/bin/sh
set -e
set -x

package=gdb-5.3

PATH=/usr/local/bin:$PATH
export PATH

tar_options="--no-same-owner"

. preamble.inc

if [ ! -f .patched ]; then
	patch -p1 -i $patches/$package.patch
	touch .patched
fi

config_options=""

CONFIG_SHELL=/usr/local/bin/bash
export CONFIG_SHELL

. $incdir/build.inc

unset CONFIG_SHELL
