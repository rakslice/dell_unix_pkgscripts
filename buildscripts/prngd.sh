#!/bin/sh
set -e
set -x

package=prngd-0.9.29

PATH=/usr/local/bin:$PATH
export PATH

. preamble.inc

if [ ! -f .patched ]; then
	patch -p1 -i $patches/$package.patch
	touch .patched
fi

# manual build

make CC=gcc CFLAGS="-O2 -Wall -DFREEBSD" DEFS="-DRANDSAVENAME=\\\"/usr/local/etc/prngd/pgrnd-seed\\\" -DCONFIGFILE=\\\"/usr/local/etc/prngd/prngd.conf\\\" " SYSLIBS="-lnsl -lsocket"

# manual install

target="$srcdir/destdir/$package/usr/local"

pkgdestrootbased=1

for d in $target $target/bin $target/sbin $target/etc $target/etc/prngd $target/var $target/var/run; do
	if [ ! -d "$d" ]; then
		mkdir -p "$d"
	fi
done

cp prngd $target/sbin/
cp $incdir/startprngd $target/bin/
cp $incdir/prngd.conf $target/etc/prngd/

# no op make, we just want to package

no_configure=1
make_cmd=true

. $incdir/build.inc

