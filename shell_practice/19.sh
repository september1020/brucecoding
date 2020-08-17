#!/bin/bash

while getopts :ab:c opt
do
	case "$opt" in 
		a) echo "Found the a option, location is $OPTIND";;
		b) echo "Found the b option, with value $OPTARG in location $OPTIND";;
		c) echo "Found the c option, location is $OPTIND";;
		*) echo "There is no option: $opt"
	esac
done
	

