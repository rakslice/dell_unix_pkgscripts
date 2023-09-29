#!/bin/sh
set -e
set -x

package=jpeg-6b

tarball_prefix=jpegsrc.v6b.tar

PATH=/usr/local/bin:$PATH
export PATH

. preamble.inc

config_options="--enable-static --enable-shared"

CONFIG_SHELL=/usr/local/bin/bash
export CONFIG_SHELL

. $incdir/build.inc

unset CONFIG_SHELL

