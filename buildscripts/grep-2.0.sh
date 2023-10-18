#!/bin/sh
set -e
set -x

package=grep-2.0

use_old_tar=1

. preamble.inc

PATH=/usr/dell/gcc-2/bin:$PATH
export PATH

prefixvar=prefix

for f in bin man/man1; do
	if [ ! -d $srcdir/destdir/$package/$f ]; then
		mkdir -p $srcdir/destdir/$package/$f
	fi
done

. $incdir/build.inc

