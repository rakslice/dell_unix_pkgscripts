#!/bin/sh
set -e
set -x

storage_location=/home2
read pause

[ -d $storage_location ]

working_dir=$storage_location/dell

if [ ! -d $working_dir ]; then
	mkdir $working_dir
fi

ln -s $working_dir /home/dell

if [ ! -d /usr/local ]; then
	mkdir $storage_location/local
	ln -s $storage_location/local /usr/local
fi

if [ ! -d $working_dir/buildscripts ]; then
	cp -r * $working_dir/
fi

cd $working_dir/buildscripts

./all.sh