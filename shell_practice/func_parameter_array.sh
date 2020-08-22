#!/bin/bash
set -x

function testarray {
	echo "the parameter is: $@"
}

myarray=(1 2 3 4)

testarray ${myarray[*]}


echo "############################################################################"

arraydouble () {
	local originalarray
	local newarray
	local elements
	local index

	originalarray=($(echo "$@"))
	newarray=($(echo "$@"))
	elements=$[ $# - 1]

	for ((i=0; i <=$elements; i++)){
		newarray[$i]=$[ ${originalarray[$i]} * 2 ]
	}
	
	echo "${newarray[*]}"
}

myarray2=(1 2 3 4)
arraydouble ${myarray2[*]}

