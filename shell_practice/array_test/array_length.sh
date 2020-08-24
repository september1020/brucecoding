#!/bin/bash

declare -a array1
array1=(1 2 3 4 5 6 7 8)

echo "below 2 is the length of array1."
echo "${#array1[@]}"
echo "${#array1[*]}"

echo "below 2 is the index of array1."
echo "${!array1[@]}"
echo "${!array1[*]}"


echo "this is to go througth array1 via index and for loop."
for i in "${!array1[@]}";do
	echo "${array1[i]}"
done


echo "this a slice of the array1 via index."
echo "${array1[@]:1:2}"


echo "this is to enrich the array1."
array1+=(a b)

for i in "${!array1[@]}";do
	echo "${array1[i]}"
done

