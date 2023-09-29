#!/bin/sh
set -e
set -x

package=wget-1.11

use_old_tar=1

. preamble.inc

if [ ! -f .patches ]; then
	( /usr/bin/patch -p1 < $patches/$package.patch.og )
fi

#cp $codefragments/strcasecmp.c src/lib/

#config_libs="-lm -lz -ljpeg -ltiff"
#config_options="PNG_LIBS=-lpng16 PNG_CFLAGS=-I/usr/local/include/libpng16"

PATH=/usr/dell/gcc-2/bin:/usr/local/bin:$PATH
export PATH

. $incdir/build.inc

