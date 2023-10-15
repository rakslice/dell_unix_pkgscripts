#!/bin/sh
set -e
set -x

package=make-3.76.1

PATH=/usr/local/bin:/usr/dell/gcc-2/bin:$PATH
export PATH

use_old_tar=1  # workaround for tar format issue

. preamble.inc

#cp $codefragments/strcasecmp.c src/lib/

#config_libs="-lm -lz -ljpeg -ltiff"
#config_options="--disable-nls --enable-languages=c,c++"

if [ ! -f .patched ]; then
	patch -p1 < $patches/$package.patch
	touch .patched
fi

CONFIG_SHELL=/usr/local/bin/bash
export CONFIG_SHELL


. $incdir/build.inc

unset CONFIG_SHELL

