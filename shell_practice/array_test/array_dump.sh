#!/bin/bash

array1=(a b c d e f)

array2=( "${array1[@]}" bruce)

array3=( "${array1[*]}" bruce1)
#上面这两个办法,都可复制数组.

for i in ${array1[@]};do
	echo "$i"
done



for y in ${array2[@]};do
	echo "$y"
done

for z in ${array3[@]};do
	echo "$z"
done
