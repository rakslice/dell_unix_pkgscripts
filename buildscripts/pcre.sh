#!/bin/sh
set -e
set -x

package=pcre-8.02

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

#configure_cmd="./Configure"

config_options=""

CONFIG_SHELL=/usr/local/bin/bash
export CONFIG_SHELL

. $incdir/build.inc

unset CONFIG_SHELL

