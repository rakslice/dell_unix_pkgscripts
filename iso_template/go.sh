#!/bin/sh
set -e
set -x

storage_location=/home2
pkg_storage=/home3/pkg
read pause

[ -d $storage_location ]

working_dir=$storage_location/dell

if [ ! -d $working_dir ]; then
	mkdir $working_dir
fi

if [ ! -d $pkg_storage ]; then
	mkdir $pkg_storage
fi

ln -s $working_dir /home/dell

ln -s $pkg_storage /home/dell/pkg

if [ ! -d /usr/local ]; then
	mkdir $storage_location/local
	ln -s $storage_location/local /usr/local
	mkdir $storage_location/var_tmp
	chmod 777 $storage_location/var_tmp
	chmod +t $storage_location/var_tmp
	rm -rf /var/tmp
	ln -s $storage_location/var_tmp /var/tmp
fi

if [ ! -d $working_dir/buildscripts ]; then
	cp -r * $working_dir/
fi

cd $working_dir/buildscripts

REMOVE_BUILT_SOURCE_DIRS=1
export REMOVE_BUILT_SOURCE_DIRS

./all.sh
