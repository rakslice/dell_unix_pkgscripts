#!/bin/sh
set -e
set -x

package=bash-3.2.57

PATH=/usr/local/bin:$PATH
export PATH

. preamble.inc

CONFIG_SHELL=/usr/local/bin/bash
export CONFIG_SHELL

configure_cmd="bash configure"

prefixvar=DESTDIR
pkgdestrootbased=1

. $incdir/build.inc

cp /usr/local/bin/bash /usr/local/bin/bash-3

unset CONFIG_SHELL
unset SHELL

