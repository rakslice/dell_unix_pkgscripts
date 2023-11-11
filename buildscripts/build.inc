
pkgtemplatesdir="$incdir/pkgtemplates/$package"
[ -d "$pkgtemplatesdir" ] || exit 1
[ -f "$pkgtemplatesdir/pkginfo" ] || exit 1


if [ "$configure_cmd" = "" ]; then
	configure_cmd="./configure"
fi

if [ "$no_configure" = "" ] && ([ "$configure_once" = "" ] || [ ! -f .configured ]); then
  # we are doing a configure

  if [ "$config_libs" != "" ]; then
	$configure_cmd LIBS="$config_libs" $config_options
  else
	$configure_cmd $config_options
  fi

  # a pause for checking the configure output
  #read pause

  touch .configured
fi

if [ "$make_cmd" = "" ]; then
	make_cmd=make
fi

if [ "$prefixvar" = "" ]; then
	prefixvar=prefix
fi

$make_cmd $make_args

destdir="$srcdir/destdir"

if [ ! -d "$destdir" ]; then
	mkdir "$destdir"
fi

pkgdestdir="$destdir/$package"
if [ "$pkgdesttrailingslash" != "" ]; then
	pkgdestdir="$pkgdestdir/"
fi

if [ ! -d "$pkgdestdir" ]; then
	mkdir "$pkgdestdir"
fi

$make_cmd install "$prefixvar=$pkgdestdir" $make_install_args

# check that anything appeared in the pkgdestdir after the make install

if [ -z "`ls -a "$pkgdestdir" | fgrep -vx '.' | fgrep -vx '..'`" ]; then
	exit 1
fi

# prepare the pkg output directory and the prototype file if it doesn't exist

pkgdir="$srcdir/pkg"

if [ ! -d "$pkgdir" ]; then
	mkdir "$pkgdir"
fi

realprefix=/usr/local

if [ "$pkgdestrootbased" = "" ]; then
	pkgprotoprefix="$realprefix/"
else
	pkgprotoprefix="/"
fi

if [ ! -f "$pkgtemplatesdir/prototype" ]; then
	printf "i\tpkginfo\n" > "$pkgtemplatesdir/prototype.new" || true
	(cd "$pkgdestdir" ; pkgproto ".=$pkgprotoprefix" >> "$pkgtemplatesdir/prototype.new")
	mv "$pkgtemplatesdir/prototype.new" "$pkgtemplatesdir/prototype"
	# a pause to modify symlinks
	# TODO actually script something here
	read pause
fi

# remove any files from the destdir we specifically want to exclude
if [ "$do_not_package" != "" ]; then
	for curspec in $do_not_package; do
		if [ -f "$pkgdestdir/$curspec" ] || [ -d "$pkgdestdir/$curspec" ]; then
			rm -rf "$pkgdestdir/$curspec"
		fi
	done
fi

# check if there are extra files in the destdir missing from the proto

set +x

(cd "$pkgdestdir"; find . -type f -print) | (
failed=no
while read curfile; do
	curfile=`echo "$curfile" | cut -d/ -f2-`
	if fgrep " $pkgprotoprefix$curfile=" "$pkgtemplatesdir/prototype" > /dev/null ; then
		true
	else
		echo $pkgtemplatesdir/prototype is missing $curfile
		failed=yes
	fi
done
if [ "$failed" = "yes" ]; then
	exit 1
fi)

set -x

# remove existing package output if it exists

eval `grep '^PKG=' $pkgtemplatesdir/pkginfo`

[ ! -z "$PKG" ] || exit 1

if [ -d "$pkgdir/$PKG" ]; then
	rm -rf "$pkgdir/$PKG"
fi

unset PKG

# create the package

pkgmk -d "$pkgdir" -f "$pkgtemplatesdir/prototype" -b "$pkgdestdir"

# install the package

eval `grep '^PKG=' $pkgtemplatesdir/pkginfo`
pkgadd -nd "$pkgdir" $PKG

# remove the completed pkgdest

rm -rf "$pkgdestdir"

cd "$srcdir"

if [ "$REMOVE_BUILT_SOURCE_DIRS" != "" ]; then
	# remove the completed source directory
	rm -rf "$srcdir/$packagedir"
fi

