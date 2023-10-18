#!/bin/sh
set -e
set -x

package=make-3.76.1

PATH=/usr/local/bin:/usr/dell/gcc-2/bin:$PATH
export PATH

use_old_tar=1  # workaround for tar format issue

. preamble.inc

if [ ! -f .patched ]; then
	patch -p1 < $patches/$package.patch
	touch .patched
fi

CONFIG_SHELL=/usr/local/bin/bash
export CONFIG_SHELL

prefixvar=prefix

. $incdir/build.inc

unset CONFIG_SHELL

