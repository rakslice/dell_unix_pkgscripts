#!/bin/sh
set -e
set -x

package=m4-1.4.10

PATH=/usr/local/bin:$PATH
export PATH

. preamble.inc

cp $codefragments/strcasecmp.c .

configure_cmd="bash configure"
configure_once=1

config_options=""

prefixvar=DESTDIR
pkgdestrootbased=1

CONFIG_SHELL=/usr/local/bin/bash
export CONFIG_SHELL

. $incdir/build.inc

unset CONFIG_SHELL

