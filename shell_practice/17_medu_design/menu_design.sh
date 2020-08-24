#!/bin/bash

function menu {
clear
echo
echo -e "\t\t\tSys Admin Menu\n"
echo -e "\t1. Display disk space"
echo -e "\t2. Display logon users"
echo -e "\t3. Display mem usage"
echo -e "\t0. Exit programe"

echo -e "Enter Your Option:"
read -n 1 option


}

function diskspace {
	clear
	df -k
}

function whoseon {
	clear
	who
}


function memusage {
	clear
	cat /proc/meminfo
}

while :;
do

menu

case $option in 
	0)
		break;;
	1)
		diskspace;;
	2)
		whoseon;;
	3)
		memusage;;
	*)
		clear
		echo "Wrong selection";;
esac

echo -e "Any key to Continue..."
read -n 1 option

done
