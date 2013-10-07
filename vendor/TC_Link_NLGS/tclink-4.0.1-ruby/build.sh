#!/bin/sh
#
# Build script for TCLink Ruby module
#

echo \#define TCLINK_VERSION \"4.0.1-Ruby-`uname -sm | tr ' ' -`\" > config.h

ERROR=0
ruby extconf.rb || ERROR=1

if [ $ERROR = 1 ]; then
	echo "Couldn't generate Makefile.  Check to make sure you have the Ruby development package installed."
	exit 1
fi

make || exit
