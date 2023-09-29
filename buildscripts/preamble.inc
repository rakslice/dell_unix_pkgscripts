
srcdir=/home/dell
incdir=$srcdir/buildscripts
codefragments=$srcdir/codefragments
patches=$srcdir/patches

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
		letter=z
	elif [ -f $tarball_prefix.bz2 ]; then
		letter=j
	elif [ -f $tarball_prefix ]; then
		letter=
	else
		exit 1
	fi

	if [ "$use_old_tar" != "" ]; then
		/usr/local/bin/gunzip -c $tarball_prefix* | tar xf -
	else
		tar x${letter}f $tarball_prefix*
	fi

	use_old_tar=
fi

[ -d $packagedir ]

cd $packagedir
