#!/bin/sh
set -e
set -x

package=perl-5.8.9

PATH=/usr/local/bin:$PATH
export PATH

. preamble.inc

#cp $incdir/perl/config.sh .

configure_cmd="bash Configure -Dinstallprefix=$srcdir/destdir/$package -de"
configure_once=1

CONFIG_SHELL=/usr/local/bin/bash
export CONFIG_SHELL

prefixvar=nevermind

. $incdir/build.inc

unset CONFIG_SHELL

