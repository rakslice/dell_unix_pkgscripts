#!/bin/sh
set -e
set -x

package=diffutils-2.7

use_old_tar=1

. preamble.inc

PATH=/usr/local/bin:/usr/dell/gcc-2/bin:$PATH
export PATH

. $incdir/build.inc

