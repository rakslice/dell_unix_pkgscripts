#!/bin/sh
set -e
set -x

package=bash-1.14.7

use_old_tar=1

. preamble.inc

no_configure=1

PATH=/usr/dell/gcc-2/bin:$PATH
export PATH

if [ -f /usr/local/bin/bash ]; then
	rm /usr/local/bin/bash
fi

. $incdir/build.inc

cp /usr/local/bin/bash /usr/local/bin/bash-1

