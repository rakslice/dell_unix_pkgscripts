#!/bin/sh
set -e
set -x

package=grep-2.5.4

PATH=/usr/local/bin:$PATH
export PATH


. preamble.inc

if [ ! -f .patched ]; then
        patch -p1 -i $patches/$package.patch
        touch .patched
fi

cp $codefragments/strcasecmp.c src/

. $incdir/build.inc

