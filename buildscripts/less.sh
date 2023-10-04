#!/bin/sh
set -e
set -x

package=less-382

PATH=/usr/local/bin:$PATH
export PATH

. preamble.inc

config_options=""

CONFIG_SHELL=/usr/local/bin/bash
export CONFIG_SHELL

. $incdir/build.inc

unset CONFIG_SHELL

