#!/bin/bash
#set -xv
:<<!
echo "============loop until========="

C=20
until [ $C -lt 10 ]; do
	echo itme1: $C
	let C=C-1
done
!
#new='this is new'
variable='it is variable'
echo ${variable:0:1}
echo ${variable:1:1}
echo ${variable:0:2}
echo ${variable: -3}
#这个是输出变量variable串的最后三个字符, 即ble.
echo ${variable1:-3}
#这个的意思是如果没有定义变量variable,那么就输出3.


echo "============+++++++++++++++++++++========="

variable="User:123:321:/home/dir"
echo ${variable#*:*:*:}
echo
echo ${variable##*:}
echo
echo ${variable%:*:*:*}
echo "============+++++++++++++++++++++========="

##???这个地方,没有办法理解.


echo ${variable//User/Bruce}
#这里variable前面不用$,

echo ${variable//User/Bruce} | tr '[:lower:]' '[:upper:]'
#用tr完成字符的转换.

a=10
b=20

c=$((a+b))
echo "$c"

d=`expr $a + $b`
echo "$d"



value="value1.sh"
word="word1"

echo ${value:-wordxxxxxxxxxxxx}
#这个地方,可以看到是-后面的值,而不是作为变量的值.


#echo ${value:=word}
#echo $value

#echo ${value:?messagexyb}
echo ${value:+word}

echo ${#value}

echo ${value:5}
echo ${value:(( ${#value} - 2 ))}

