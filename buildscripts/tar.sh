#!/bin/sh
set -e
set -x

package=tar-1.13.94

use_old_tar=1

. preamble.inc

if [ ! -f .patched ]; then
	/usr/bin/patch -p1 < $patches/$package.patch
	touch .patched
fi

#cp $codefragments/strcasecmp.c .

PATH=/usr/dell/gcc-2/bin:$PATH
export PATH

. $incdir/build.inc

