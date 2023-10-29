#!/bin/sh
set -e
set -x

package=screen-3.9.15

PATH=/usr/local/bin:$PATH
export PATH

. preamble.inc

CONFIG_SHELL=/usr/local/bin/bash
export CONFIG_SHELL

configure_cmd="bash configure"

prefixvar=DESTDIR
pkgdesttrailingslash=1

. $incdir/build.inc

unset CONFIG_SHELL
unset SHELL

