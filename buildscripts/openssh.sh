#!/bin/sh
set -e
set -x

package=openssh-2.9p2

PATH=/usr/local/bin:$PATH
export PATH

. preamble.inc

cp -r $codefragments/md5/* .
cp $codefragments/stdint.h .

if [ ! -f .patched ]; then
	patch -p1 -i $patches/$package.patch
	touch .patched
fi

#configure_cmd="./Configure"

#config_options="--with-prngd-socket=/usr/local/var/run/egd-pool"
config_options="--with-prngd-port=12345"

CONFIG_SHELL=/usr/local/bin/bash
export CONFIG_SHELL

. $incdir/build.inc

unset CONFIG_SHELL

