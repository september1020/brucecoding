#!/bin/bash
 
getchar() {
 
  stty cbreak -echo
#"stty cbreak -echo" allows single characters to be read without echoing. This should be reset with "stty -cbreak echo" before the program exits.
#在这个地方,是改变了当前terminal的行为,这里的cbreak是立即读取stdin的输入,而不用buffer,每输入一个字符后,立即响应操作,而不是等enter执行.
#-echo这个是为了关闭echo的功能,这样就不会由于cbreak的原因,立即回显stdin的输入,而不是等回车.
 
  dd if=/dev/tty bs=1 count=1 2> /dev/null
  ##dd等待用户按键 bs(block size)块大小=1,count总数=1，作用只取一个字符, 2> /dev/null 不显示任何信息
 
  stty -cbreak echo
  #这里是为了恢复tty默认的行为.字符输入后会被buffer住,然后输入等有回车后一起显示.
 
}
##???这个地方,stty的玩法不清楚,找人请教一下.

#echo -n "please input your passwd: "
 
printf "please input your passwd:"
 
 
while : ; do
#这个地方,while :;作为一个永远为真的loop条件,学习一下用法.
 
  ret=`getchar`
 
  if [ x$ret = x ]; then
 
    echo
 
    break

   # else
#	    printf "$ret"
 
  fi
 
  str=$str$ret
 
  printf "*"
 
done
 
 
echo "Your password is:" $str
