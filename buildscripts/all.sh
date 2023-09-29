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
sh bash-2.sh
sh gawk.sh
sh patch.sh
sh freetype.sh
sh sed.sh
sh zlib.sh
sh grep-2.5.4.sh
sh libpng-1.6.34.sh
sh jpeg-6b.sh
sh tiff-3.9.1.sh
sh imlib.sh
sh diffutils.sh
sh windowmaker.sh
