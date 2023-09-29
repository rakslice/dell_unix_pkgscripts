#!/bin/sh
set -e
set -x

package=bzip2-1.0.6

use_old_tar=1

. preamble.inc

no_configure=1

#cp $codefragments/strcasecmp.c src/lib/

#config_libs="-lm -lz -ljpeg -ltiff"
#config_options="PNG_LIBS=-lpng16 PNG_CFLAGS=-I/usr/local/include/libpng16"

if [ ! -f .patched ]; then
	mv Makefile Makefile.orig
	sed 's/cp -f /cp /g' Makefile.orig > Makefile
	touch .patched
fi

for f in bzegrep bzfgrep bzless bzcmp; do
	if [ -f /usr/local/bin/$f ]; then
		rm /usr/local/bin/$f
	fi
done

PATH=/usr/dell/gcc-2/bin:$PATH
export PATH

. $incdir/build.inc

