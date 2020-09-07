#!/bin/bash
set -xv

echo "============+++++++++++++++++++++========="

variable="User:123:321:/home/dir"
echo ${variable#*:*:*:}
echo ${variable##*:}
##上面这两行的作用是一样的,都是只留下/home/dir这个段,不同的是#是最短匹配模式，而##是最长匹配模式.

echo ${variable%:*:*:*}
echo ${variable%%:*}
#上面这两个也是相同的,作用也是只留User字段,不同的是%是最短匹配模式,而%%是最长匹配模式.

echo "============+++++++++++++++++++++========="

var1="hello.hi.hellow.bruce.sh"

echo ${var1#*\.*\.}
echo ${var1##*\.}
#上面这个两个是分别用长匹配/短匹配模式提到文件后缀名.

echo ${var1%%\.*}
#这个的输出是hellow.

#echo ${var1/*./H.}
#这个的匹配,默认是最长匹配,所以输出是H.sh
#在这个匹配的中,pattern貌似不支持正则.

echo ${var1//h/H}
#这个是全局的替换h为H.//>>/,则是只替换开头的第一个}

echo $var1

echo ${var1/#h/H}
echo ${var1/l/H}
#这里的#表示从开头配置o,然后替换为H.
