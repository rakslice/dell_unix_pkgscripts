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
sh make-3.82.sh
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
sh libast.sh
sh eterm.sh

sh perl.sh
sh openssl.sh
sh pcre.sh
sh prngd.sh
# start prngd as openssh make install will try to use it to generate keys
/usr/local/bin/startprngd
sh openssh.sh

sh tcl.sh
sh git.sh

sh gdb-5.3.sh
sh less.sh
