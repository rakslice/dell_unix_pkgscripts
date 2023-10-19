#!/bin/sh
set -e
set -x

package=vim-8.1.0037

PATH=/usr/local/bin:$PATH
export PATH

. preamble.inc

if [ ! -f .patched ]; then
	patch -p1 -i $patches/$package.patch
	touch .patched
fi

# there are a bunch of link failures with the gui libs, so let's just
# go text only for now
config_options="--disable-nls --without-x --enable-gui=no"

CONFIG_SHELL=/usr/local/bin/bash
export CONFIG_SHELL

prefix_var=DESTDIR

configure_cmd="bash configure"

. $incdir/build.inc

unset CONFIG_SHELL
unset SHELL

