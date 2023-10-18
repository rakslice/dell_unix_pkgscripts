#!/bin/sh
set -e
set -x

package=gzip-1.2.4

use_old_tar=1

. preamble.inc

prefixvar=prefix

. $incdir/build.inc

