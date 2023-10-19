#!/bin/sh
set -e
set -x

package=mpc-1.0.1

PATH=/usr/local/bin:$PATH
export PATH

. preamble.inc

config_options=""

ACCEPT_INFERIOR_RM_PROGRAM=yes
export ACCEPT_INFERIOR_RM_PROGRAM

CONFIG_SHELL=/usr/local/bin/bash
export CONFIG_SHELL

prefixvar=DESTDIR
pkgdestrootbased=1

. $incdir/build.inc

unset CONFIG_SHELL

