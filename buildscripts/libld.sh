#!/bin/sh
set -e
set -x

package=libld

PATH=/usr/local/bin:$PATH
export PATH


pkgdir=/home/dell/$package
if [ ! -d $pkgdir ]; then
	mkdir $pkgdir
fi

. preamble.inc

input_lib=/usr/ccs/lib/$package.a
output_lib_proper=$package.so

rm *.o || true

ar x $input_lib

objects=*.o

for f in $objects; do
	file $f | grep relocatable
done

gcc -fPIC -shared -o $output_lib_proper $objects

file $output_lib_proper

no_configure=1

prefixvar=DESTDIR
pkgdestrootbased=1

CONFIG_SHELL=/usr/local/bin/bash
export CONFIG_SHELL

cat >Makefile <<EOF
all:
install:
	mkdir -p $(DESTDIR)/usr/ccs/lib
	cp $output_lib_proper $(DESTDIR)/usr/ccs/lib/
EOF

. $incdir/build.inc

unset CONFIG_SHELL

