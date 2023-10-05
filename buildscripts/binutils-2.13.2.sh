#!/bin/sh
set -e
set -x

package=binutils-2.13.2

PATH=/usr/local/bin:$PATH
export PATH

. preamble.inc

cd ..
builddir=build-$package
if [ ! -d $builddir ]; then
	mkdir $builddir
fi
cd $builddir

configure_cmd=../$package/configure

CONFIG_SHELL=/usr/local/bin/bash
export CONFIG_SHELL

. $incdir/build.inc

unset CONFIG_SHELL

