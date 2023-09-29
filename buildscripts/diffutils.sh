#!/bin/sh
set -e
set -x

package=diffutils-2.7

use_old_tar=1

PATH=/usr/local/bin:$PATH
export PATH

. preamble.inc

. $incdir/build.inc

