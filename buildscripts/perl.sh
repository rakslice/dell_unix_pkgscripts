#!/bin/sh
set -e
set -x

package=perl-5.6.2

PATH=/usr/local/bin:$PATH
export PATH

. preamble.inc

if [ ! -f .patched ]; then
	patch -p1 -i $patches/$package.patch
	touch .patched
fi

cp $incdir/perl/config.sh .

configure_cmd="bash Configure -d"

#config_options="-de -Dcc=gcc -Dusedl=n"

CONFIG_SHELL=/usr/local/bin/bash
export CONFIG_SHELL

. $incdir/build.inc

unset CONFIG_SHELL

