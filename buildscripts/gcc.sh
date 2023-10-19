#!/bin/sh
set -e
set -x

package=gcc-2.95.3

PATH=/usr/local/bin:$PATH
export PATH

. preamble.inc

config_options="--disable-nls --enable-languages=c,c++"

if [ ! -f .patched ]; then
	patch -p1 < $patches/$package.patch
	touch .patched
fi

cd ..
if [ ! -d build-gcc ]; then
	mkdir build-gcc
fi
cd build-gcc

configure_cmd=../$package/configure
configure_once=1

CONFIG_SHELL=/usr/local/bin/bash
export CONFIG_SHELL

. $incdir/build.inc

unset CONFIG_SHELL

