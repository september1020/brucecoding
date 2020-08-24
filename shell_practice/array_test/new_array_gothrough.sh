#!/bin/bash

#新建一个数组.
array1=(1 2 3 4 5 6)

#遍历一个数组
for i in "${array1[@]}"; do
	echo -en "$i";
	echo -ne "\t"
done
echo

echo "for-1#######################"

#显示数据的长度.
echo "${#array1[@]}"

for ((i=0; i<="${#array1[@]}"; i++)) do
	echo -ne "${array1[i]}"
	echo -ne "\t"
done
echo

echo "for-2#######################"


echo




:<<!
-e是解释""中的转义.
-n是取消末尾的换行.
!



echo "###################################################"

activities=( swimming "water skiing" canoeing "white-water rafting" surfing )


for i in "${activities[@]}"; do
	echo -e "$i";
	#echo -ne "\t"
done
echo
#放在""中后,数组中的"water skiing"即使中间有空格,也是作为一个元素处理.
#如果像下面这样,不放到""中, 元素"water skiing"就会被作为两个元素来处理.

for i in ${activities[@]}; do
	echo -e "$i";
	#echo -ne "\t"
done
echo

for i in "${activities[*]}"; do
	echo -e "$i";
	#echo -ne "\t"
done
echo
#这个测试中, 整个activities数组会以单个串的方式返回.
echo '#####"${activities[*]}"#####'


for i in ${activities[@]}; do
	echo "$i";
	#echo -ne "\t"
done
echo
#这个测试和${activities[@]}是一样的.
echo '#####${activities[*]}#####'

