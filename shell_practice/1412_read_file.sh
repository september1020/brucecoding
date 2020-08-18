#!/bin/bash

:<<!
这个脚本作为读取文件的参考.做法是先把$1设置为标准输入的源文件,然后while+read完成操作.
这里会用描述符6临时转存标准输入,完成读取后,恢复过来.
!

exec 6<&0

exec 0<$1

count=1

while read line
do
	echo "Line $count: $line"
	count=$[ $count + 1 ]
done

exec 0<&6
#如果是读取文件的时候,记得做用一个描述符来存放默认的标准输入描述符0.完成读取的时候,再把默认值恢复过来.这样才是比较好的做法.

