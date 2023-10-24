#!/bin/sh
set -e
set -x

package=libpng-1.6.34

PATH=/usr/local/bin:$PATH
export PATH

. preamble.inc

config_options="--enable-mips-msa=no --enable-powerpc-vsx=no"

ACCEPT_INFERIOR_RM_PROGRAM=yes
export ACCEPT_INFERIOR_RM_PROGRAM

CONFIG_SHELL=/usr/local/bin/bash
export CONFIG_SHELL

configure_cmd="bash configure"

prefixvar=DESTDIR
pkgdestrootbased=1

. $incdir/build.inc

unset CONFIG_SHELL
unset ACCEPT_INFERIOR_RM_PROGRAM

