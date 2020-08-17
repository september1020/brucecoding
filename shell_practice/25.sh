#!/bin/bash

read -t 5 -p "Enter your name:" name
#这个地方比较有意思的是如果没有任何输入超时后,会有什么样的结果.
#实际是这里如果没有输入的话,他会调用当前session中已经有的变量$name的值,包然后执行下面的打印
#比如:之前一次执行这个脚本的时候,name=bruce. 如果这次没有输入超时,那么任何会执行下面的echo,变量name=bruce.

echo "Hello $name, welcome to my script!"
