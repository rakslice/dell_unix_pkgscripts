#!/bin/sh
set -e
set -x

package=bash-2.04

PATH=/usr/local/bin:/usr/dell/gcc-2/bin:$PATH
export PATH

. preamble.inc

#cp $codefragments/strcasecmp.c src/lib/

#config_libs="-lm -lz -ljpeg -ltiff"
#config_options="--disable-nls --enable-languages=c,c++"

#if [ ! -f .patched ]; then
#	patch -p1 < $patches/$package.patch
#	touch .patched
#fi

CONFIG_SHELL=/usr/local/bin/bash
export CONFIG_SHELL

#configure_cmd="bash configure"


. $incdir/build.inc

unset CONFIG_SHELL
unset SHELL

