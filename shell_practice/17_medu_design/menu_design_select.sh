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

PS3="Enter Your option[1.Display disk space 2.Display logon users]:"
select option in "Display disk space" "Display logon users" "Display mem usage" "Exit programe"
do
	case $option in

	"Exit programe")
		break;;
	"Display disk space")
		diskspace;;
	"Display logon users")
		whoseon;;
	"Display mem usage")
		memusage;;
	*)
		clear
		echo "Wrong selection";;
esac

#echo -e "Any key to Continue...

done
clear
