#!/bin/sh
set -e
set -x

package=screen-3.9.15

PATH=/usr/local/bin:$PATH
export PATH

. preamble.inc

#if [ ! -f .patched ]; then
#	patch -p1 < $patches/$package.patch
#	touch .patched
#fi

CONFIG_SHELL=/usr/local/bin/bash
export CONFIG_SHELL

configure_cmd="bash configure"

. $incdir/build.inc

unset CONFIG_SHELL
unset SHELL

