#!/bin/sh
set -e
set -x

package=gawk-3.0.6

PATH=/usr/local/bin:$PATH
export PATH

. preamble.inc

CONFIG_SHELL=/usr/local/bin/bash
export CONFIG_SHELL

configure_cmd="bash configure"

prefixvar=prefix

. $incdir/build.inc

unset CONFIG_SHELL
unset SHELL

