#!/bin/sh
set -e
set -x

package=git-2.17.0

PATH=/usr/local/bin:/usr/ucb:$PATH
export PATH

tar_options="--no-same-owner"

. preamble.inc

if [ ! -f .patched ]; then
	patch -p1 -i $patches/$package.patch
	touch .patched
fi

cp $codefragments/stdint.h .
cp $codefragments/strcasecmp.c .
cp $codefragments/timewrap.c .
cp $codefragments/pread.c .
cp $codefragments/strtoll.c compat/
cp $codefragments/strtoull.c compat/
cp $codefragments/c99-snprintf/snprintf.c c99_snprintf.c

configure_cmd="bash configure"

config_options="--without-iconv"

CONFIG_SHELL=/usr/local/bin/bash
export CONFIG_SHELL

SHELL_PATH=/usr/local/bin/bash
export SHELL_PATH

NO_ICONV=1
export NO_ICONV

make_args="V=1 NO_MSGFMT=1"

. $incdir/build.inc

unset NO_ICONV
unset NO_MSGFMT

unset SHELL_PATH
unset CONFIG_SHELL

