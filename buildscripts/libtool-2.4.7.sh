#!/bin/sh
set -e
set -x

package=libtool-2.4.7

PATH=/usr/local/bin:$PATH
export PATH

. preamble.inc

if [ ! -f .patched ]; then
	patch -p1 -i $patches/$package.patch
	touch .patched
fi

configure_cmd="bash  configure"
configure_once=1

#config_options="--enable-shared --with-gnu-ld"
config_options=""

ACCEPT_INFERIOR_RM_PROGRAM=yes
export ACCEPT_INFERIOR_RM_PROGRAM

CONFIG_SHELL=/usr/local/bin/bash
export CONFIG_SHELL

SHELL=/usr/local/bin/bash
export SHELL

. $incdir/build.inc

unset CONFIG_SHELL
unset SHELL

