#!/bin/bash
#set -x
 
getchar() {
 
  stty cbreak -echo
#"stty cbreak -echo" allows single characters to be read without echoing. This should be reset with "stty -cbreak echo" before the program exits.
#在这个地方,是改变了当前terminal的行为,这里的cbreak是立即读取stdin的输入,而不用buffer,每输入一个字符后,立即响应操作,而不是等enter执行.
#-echo这个是为了关闭echo的功能,这样就不会由于cbreak的原因,立即回显stdin的输入,而不是等回车.
 
  dd if=/dev/tty bs=1 count=1 2> /dev/null
  ##dd等待用户按键 bs(block size)块大小=1,count总数=1，作用只取一个字符, 2> /dev/null,不显示任何的error信息到标准输出.
  ##if是用来指定输入源,这里是tty.
  ##dd命令用于读取、转换并输出数据。dd可从标准输入或文件中读取数据，根据指定的格式来转换数据，再输出到文件、设备或标准输出。
 
  stty -cbreak echo
  #这里是为了恢复tty默认的行为.字符输入后会被buffer住,然后输入等有回车后一起显示.
 
}
##???这个地方,stty的玩法不清楚,找人请教一下.

#echo -n "please input your passwd: "
 
printf "please input your passwd:"
 
 
while : ; do
#这个地方,while :;作为一个永远为真的loop条件,学习一下用法.
 
  ret=`getchar`
 
  if [ 1$ret = 1 ]; then
#这里左右两边的值可以是任意字符,详细内容见下面的执行log,方便理解. 
    #echo
 
    break

   # else
#	    printf "$ret"
 
  fi
 
  str=$str$ret
 
  printf "*"
 
done
echo
## 上面的if后面echo注释掉后,也可以在这里加入echo.两者是相同的,都是在输入提示信息后下面的echo打印之前担任一个换行,
 
echo "Your password is:" $str



:<<!
root@server2:~/brucecoding/shell_practice# ./passwd_with_stars.sh 
+ printf 'please input your passwd:'
please input your passwd:+ :
++ getchar
++ stty cbreak -echo
++ dd if=/dev/tty bs=1 count=1
++ stty -cbreak echo
+ ret=a
+ '[' 1a = 1 ']'
+ str=a
+ printf '*'
*+ :
++ getchar
++ stty cbreak -echo
++ dd if=/dev/tty bs=1 count=1
++ stty -cbreak echo
+ ret=b
+ '[' 1b = 1 ']'
+ str=ab
+ printf '*'
*+ :
++ getchar
++ stty cbreak -echo
++ dd if=/dev/tty bs=1 count=1
++ stty -cbreak echo
+ ret=c
+ '[' 1c = 1 ']'
+ str=abc
+ printf '*'
*+ :
++ getchar
++ stty cbreak -echo
++ dd if=/dev/tty bs=1 count=1
++ stty -cbreak echo
+ ret=
+ '[' 1 = 1 ']'
在这里是最后一个keyboard输入回车,没有任何可打印的字符,所以if的条件成功,这样就执行echo执行,然后break跳出这个while loop.
+ echo
如果没有上面的echo的操作,输出会是这样的:please input your passwd:*****Your password is: aaaaa.

+ break
+ echo 'Your password is:' abc
Your password is: abc
!
