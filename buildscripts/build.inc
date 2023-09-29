
if [ "$configure_cmd" = "" ]; then
	configure_cmd="./configure"
fi

if [ "$config_libs" != "" ]; then
	$config_vars $configure_cmd LIBS="$config_libs" $config_options
else
	$config_vars $configure_cmd $config_options
fi

if [ "$make_cmd" = "" ]; then
	make_cmd=make
fi


$make_cmd $make_args


$make_cmd install $make_install_args


	
