#!/bin/sh
set -e
set -x

package=binutils-2.9.1

use_old_tar=1

. preamble.inc

cd ..
if [ ! -d build-binutils ]; then
	mkdir build-binutils
fi
cd build-binutils

configure_cmd=../$package/configure

configure_once=1

prefixvar=prefix

CONFIG_SHELL=/usr/local/bin/bash
export CONFIG_SHELL

PATH=/usr/local/bin:/usr/dell/gcc-2/bin:$PATH
export PATH

. $incdir/build.inc

unset CONFIG_SHELL

