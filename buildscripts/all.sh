#!/bin/sh
set -e
set -x

if false; then
	echo ""
fi

sh gzip.sh
sh bzip2.sh
sh grep-2.0.sh
sh wget.sh
sh bash-1.sh
sh tar.sh
sh make.sh
sh binutils.sh
sh gcc.sh

