#!/bin/bash


MY_PATH=`pwd`/build/

export LD_LIBRARY_PATH=$MY_PATH/lib/:$LD_LIBRARY_PATH

if [ $1 = "applet" ]; then
	$MY_PATH/bin/seafile-applet # Call gui seafile
else 
	$MY_PATH/bin/seafile "$@"	# Call cmd line interface, pass-through the arguments
fi
