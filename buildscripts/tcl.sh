#!/bin/sh
set -e
set -x

package=tcl8.4.20
tarball_prefix=$package-src.tar

PATH=/usr/local/bin:$PATH
export PATH

. preamble.inc

cd unix

LIBS="-lucb"
export LIBS

prefixvar=DESTDIR
pkgdestrootbased=1

localbindir="$srcdir/destdir/$package/usr/local/bin"
mkdir -p "$localbindir"

if [ ! -h "$localbindir/tclsh" ]; then
  (cd "$localbindir"; ln -s tclsh8.4 tclsh)
fi

. $incdir/build.inc

unset LIBS

