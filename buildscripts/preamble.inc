
srcdir=/home/dell
incdir=$srcdir/buildscripts
codefragments=$incdir/codefragments
patches=$incdir/patches

# reset build vars
config_vars=
no_configure=


if [ "$packagedir" = "" ]; then
	packagedir=$package
fi

cd $srcdir

if [ ! -d $packagedir ]; then

	if [ "$tarball_prefix" = "" ]; then
		tarball_prefix="$package.tar"
	fi

	if [ ! -f $tarball_prefix* ]; then
		wg $tarball_prefix
	fi

	[ -f $tarball_prefix* ]

	letter=
	if [ -f $tarball_prefix.gz ]; then
		letter=-z
		old_prog=/usr/local/bin/gunzip
	elif [ -f $tarball_prefix.bz2 ]; then
		letter=-j
		old_prog=/usr/local/bin/bunzip2
	elif [ -f $tarball_prefix ]; then
		letter=
		old_prog=
	else
		exit 1
	fi

	if [ "$tar_cmd" = "" ]; then
		tar_cmd=tar
	fi

	if [ "$use_old_tar" != "" ]; then
		$old_prog -c $tarball_prefix* | $tar_cmd $tar_options xf -
	else
		$tar_cmd $tar_options -x ${letter} -f $tarball_prefix*
	fi

	use_old_tar=
fi

[ -d $packagedir ]

cd $packagedir
