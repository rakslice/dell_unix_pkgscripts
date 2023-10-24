#!/bin/sh

storage_location=/home2

if [ ! -d /usr/local ]; then
	mkdir $storage_location/local
	ln -s $storage_location/local /usr/local
	mkdir $storage_location/var_tmp
	chmod 777 $storage_location/var_tmp
	chmod +t $storage_location/var_tmp
	rm -rf /var/tmp
	ln -s $storage_location/var_tmp /var/tmp
fi

# install the package files

pkgfiles=`pwd`/pkgfiles
pkgadd -nd $pkgfiles/GNUgz124.pkg GNUgz124

# TODO right now just installing them in lexicographical order is fine,
# but we'll want an explicit package ordering at some point

for pkg in $pkgfiles/*.pkg.gz; do
	pkg_proper=`basename "$pkg" | cut -d. -f1`
	/usr/local/bin/gunzip -c $pkg > /var/tmp/${pkg_proper}.pkg
	pkgadd -nd /var/tmp/${pkg_proper}.pkg ${pkg_proper}
	rm /var/tmp/${pkg_proper}.pkg
done
