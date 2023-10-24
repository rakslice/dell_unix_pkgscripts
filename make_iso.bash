#!/bin/bash
set -e  -u -x

fs_dir=iso_temp
archive=/srv/nfs/archive
pkgfiles_archive=/srv/nfs/dell/pkgfiles

if [ -d $fs_dir ]; then
	rm -rf $fs_dir
fi

# prepare the iso fs

mkdir $fs_dir

# - buildscripts

cp -R buildscripts $fs_dir/
rm -rf $fs_dir/buildscripts/.git

# - main scripts

cp -R iso_template/* $fs_dir/

# - sources

mkdir $fs_dir/src

for sh_file in buildscripts/*.sh; do
	if [ "$sh_file" == "buildscripts/all.sh" ]; then continue; fi
	if ! grep -q "^package=" $sh_file; then continue; fi
	package=$(grep "^package=" $sh_file | cut -d'=' -f2-)
	if grep -q tarball_prefix= $sh_file; then
		tarball_prefix=$(grep "tarball_prefix=" $sh_file | cut -d'=' -f2-)
		tarball_prefix=$(echo "$tarball_prefix" | sed 's#$package#'"$package"'#')
	else
		tarball_prefix=${package}.tar
	fi
	ls -l $archive/$tarball_prefix* 
	[ $(ls -l $archive/$tarball_prefix* | wc -l) -eq 1 ]
	cp $archive/$tarball_prefix* $fs_dir/src/
done

bg_package=$(grep bg_package= buildscripts/eterm.sh | cut -d= -f2-)
cp $archive/$bg_package.tar* $fs_dir/src/

# - packages

mkdir $fs_dir/pkgfiles
cp $pkgfiles_archive/* $fs_dir/pkgfiles/

# build the iso file

genisoimage -lJR -o buildscripts.iso $fs_dir

rm -rf $fs_dir/

