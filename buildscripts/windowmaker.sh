#!/bin/sh
set -e
set -x

package=WindowMaker-0.70.0

PATH=/usr/local/bin:$PATH
export PATH

. preamble.inc

cp $codefragments/strcasecmp.c WINGs/

if [ ! -f .patched ]; then
	patch -p1 -i $patches/$package.patch
	touch .patched
fi

CONFIG_SHELL=/usr/local/bin/bash
export CONFIG_SHELL

. $incdir/build.inc

unset CONFIG_SHELL

