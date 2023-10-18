#!/bin/sh
set -e
set -x

package=wget-1.11

use_old_tar=1

. preamble.inc

if [ ! -f .patched ]; then
	/usr/bin/patch -p1 < $patches/$package.patch.og
	touch .patched
fi

PATH=/usr/dell/gcc-2/bin:/usr/local/bin:$PATH
export PATH

prefixvar=DESTDIR
pkgdestrootbased=1

. $incdir/build.inc

