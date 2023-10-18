#!/bin/sh
set -e
set -x

package=Eterm-0.9.6

bg_package=Eterm-bg-0.9.6

PATH=/usr/local/bin:$PATH
export PATH

. preamble.inc

# also get the bg tarball
if [ ! -f ../$bg_package.tar.gz ]; then
	wg $bg_package
	mv $bg_package.tar.gz ..
fi

tar xzf ../$bg_package.tar.gz

# workaround for bg install script incorrect use of relative path to install-sh
if [ ! -h bg/install-sh ]; then
  ln -s ../install-sh bg/install-sh
fi

if [ ! -f .patched ]; then
	patch -p1 -i $patches/$package.patch
	touch .patched
fi

config_libs="-lsocket -lnsl -lfreetype -lucb"

CONFIG_SHELL=/usr/local/bin/bash
export CONFIG_SHELL

SHELL=/usr/local/bin/bash
export SHELL

configure_cmd="bash configure"
config_options="--enable-mmx --disable-multi-charset"

prefixvar=DESTDIR
pkgdestrootbased=1

. $incdir/build.inc

unset CONFIG_SHELL
unset SHELL

