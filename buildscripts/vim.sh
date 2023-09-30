#!/bin/sh
set -e
set -x

package=vim-8.1.0037

#PATH=/usr/dell/gcc-2/bin:/usr/local/bin:$PATH
PATH=/usr/local/bin:$PATH
export PATH

. preamble.inc

if [ ! -f .patched ]; then
	patch -p1 -i $patches/$package.patch
	touch .patched
fi

#config_libs="-lsocket -lnsl_i"
#config_options="--x-includes=/usr/X5/include --x-libraries=/usr/X5/lib"

# there are a bunch of link failures with the gui libs, so let's just
# go text only for now
config_options="--disable-nls --without-x --enable-gui=no"

CONFIG_SHELL=/usr/local/bin/bash
export CONFIG_SHELL


. $incdir/build.inc

unset CONFIG_SHELL
unset SHELL

