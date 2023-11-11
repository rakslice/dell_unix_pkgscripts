#!/bin/sh
set -e
set -x

package=bzip2-1.0.8

use_old_tar=1

. preamble.inc

no_configure=1

cat <<EOF > meta.mk
all:
	$(MAKE) -f Makefile-libbz2_so
	$(MAKE) -f Makefile clean
	$(MAKE) -f Makefile
install:
	$(MAKE) -f Makefile PREFIX=$(PREFIX) install
	cp bzip2-shared $(PREFIX)/bin/bzip2
	cp libbz2.so* $(PREFIX)/lib
	ln -s libbz2.so.1.0 $(PREFIX)/lib/libbz2.so
EOF

make_cmd="make -f meta.mk"

#cp $codefragments/strcasecmp.c src/lib/

#config_libs="-lm -lz -ljpeg -ltiff"
#config_options="PNG_LIBS=-lpng16 PNG_CFLAGS=-I/usr/local/include/libpng16"

if [ ! -f .patched ]; then
	mv Makefile Makefile.orig
	sed 's/cp -f /cp /g' Makefile.orig > Makefile
	touch .patched
fi

# since ln has no option to force overwrite existing symlinks
# just make sure there are none to overwrite before the make install
for f in bin/bzegrep bin/bzfgrep bin/bzless bin/bzcmp lib/libbz2.so; do
	curfile=$srcdir/destdir/$package/$f
	if [ -h $curfile ]; then
		rm $curfile
	fi
done

PATH=/usr/local/bin:$PATH
export PATH

prefixvar=PREFIX

. $incdir/build.inc

