#!/bin/sh
set -e
set -x

package=mpfr-2.4.2

PATH=/usr/local/bin:$PATH
export PATH

. preamble.inc

config_options=""

CONFIG_SHELL=/usr/local/bin/bash
export CONFIG_SHELL

. $incdir/build.inc

unset CONFIG_SHELL

