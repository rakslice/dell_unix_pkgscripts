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

. $incdir/build.inc

unset LIBS

ln -s /usr/local/bin/tclsh8.4 /usr/local/bin/tclsh
