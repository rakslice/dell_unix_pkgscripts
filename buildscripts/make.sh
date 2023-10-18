#!/bin/sh
set -e
set -x

package=make-3.76.1

PATH=/usr/local/bin:/usr/dell/gcc-2/bin:$PATH
export PATH

. preamble.inc

if [ ! -f .patched ]; then
	patch -p1 < $patches/$package.patch
	touch .patched
fi

CONFIG_SHELL=/usr/local/bin/bash
export CONFIG_SHELL

prefixvar=prefix

. $incdir/build.inc

unset CONFIG_SHELL

