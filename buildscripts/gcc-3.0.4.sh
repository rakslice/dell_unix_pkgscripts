#!/bin/sh
set -e
set -x

package=gcc-3.0.4

PATH=/usr/local/bin:$PATH
export PATH

. preamble.inc

config_options="--disable-nls --enable-languages=c,c++"

if [ ! -f .patched ]; then
	patch -p1 < $patches/$package.patch
	touch .patched
fi

cd ..
builddir=build-$package
if [ ! -d $builddir ]; then
	mkdir $builddir
fi
cd $builddir

configure_cmd=../$package/configure

configure_once=1

prefixvar=prefix

CONFIG_SHELL=/usr/local/bin/bash
export CONFIG_SHELL

. $incdir/build.inc

unset CONFIG_SHELL

