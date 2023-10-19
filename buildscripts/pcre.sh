#!/bin/sh
set -e
set -x

package=pcre-8.02

PATH=/usr/local/bin:$PATH
export PATH

. preamble.inc

config_options=""

CONFIG_SHELL=/usr/local/bin/bash
export CONFIG_SHELL

prefixvar=DESTDIR
pkgdestrootbased=1

. $incdir/build.inc

unset CONFIG_SHELL

