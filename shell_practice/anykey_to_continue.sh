#!/bin/bash
get_char()
        {
        SAVEDSTTY=`stty -g`
        stty -echo
        stty cbreak
        dd if=/dev/tty bs=1 count=1 2> /dev/null
	##其实这个地方就是为了检测键盘的输入,如果count=2,那么就是检测到两个键盘的输入后退出...
        stty -raw
        stty echo
        stty $SAVEDSTTY
        }

echo "Press any key to continue..."
char=`get_char`
