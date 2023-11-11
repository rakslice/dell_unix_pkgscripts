#!/bin/sh
set -e
set -x

package=jpeg-9e

tarball_prefix=jpegsrc.v9e.tar

PATH=/usr/local/bin:$PATH
export PATH

. preamble.inc

config_options="--enable-static --enable-shared --disable-ld-version-script"

CONFIG_SHELL=/usr/local/bin/bash
export CONFIG_SHELL

ACCEPT_INFERIOR_RM_PROGRAM=yes
export ACCEPT_INFERIOR_RM_PROGRAM

# for dynamic libraries
libtoolize
autoreconf

. $incdir/build.inc

unset CONFIG_SHELL

