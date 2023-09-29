#!/bin/sh
set -e
set -x

package=grep-2.0

use_old_tar=1

. preamble.inc

PATH=/usr/dell/gcc-2/bin:$PATH
export PATH

. $incdir/build.inc

