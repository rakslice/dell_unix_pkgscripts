
if [ "$configure_cmd" = "" ]; then
	configure_cmd="./configure"
fi

if [ "$config_libs" != "" ]; then
	$configure_cmd LIBS="$config_libs" $config_options
else
	$configure_cmd $config_options
fi

# a pause for checking the config output
read pause

if [ "$make_cmd" = "" ]; then
	make_cmd=make
fi


$make_cmd $make_args


$make_cmd install $make_install_args


	
