#!/bin/sh
set -e
set -x

package=libpng-1.6.34

PATH=/usr/local/bin:$PATH
export PATH

. preamble.inc

#cp $codefragments/strcasecmp.c src/lib/

#config_libs="-lm -lz -ljpeg -ltiff"
config_options="--enable-mips-msa=no --enable-powerpc-vsx=no"

ACCEPT_INFERIOR_RM_PROGRAM=yes
export ACCEPT_INFERIOR_RM_PROGRAM

#if [ ! -f .patched ]; then
#	patch -p1 -i $patches/$package.patch
#	touch .patched
#fi

CONFIG_SHELL=/usr/local/bin/bash
export CONFIG_SHELL

. $incdir/build.inc

unset CONFIG_SHELL
unset ACCEPT_INFERIOR_RM_PROGRAM

