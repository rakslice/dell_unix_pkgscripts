#!/bin/sh
set -e
set -x

package=grep-2.5.4

PATH=/usr/local/bin:$PATH
export PATH

. preamble.inc

. $incdir/build.inc

