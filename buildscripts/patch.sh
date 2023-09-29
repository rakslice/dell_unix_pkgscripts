#!/bin/sh
set -e
set -x

# WIP. I was hoping to use this earlier for bootstrap but it doesn't
# build cleanly with old toolchain.

package=patch-2.5.4

PATH=/usr/local/bin:$PATH
export PATH

use_old_tar=1

. preamble.inc

if [ ! -f .patched ]; then
	/usr/bin/patch -p1 < $patches/$package.patch
	touch .patched
fi

cp $codefragments/strcasecmp.c .

PATH=/usr/local/bin:/usr/dell/gcc-2/bin:$PATH
export PATH

. $incdir/build.inc

