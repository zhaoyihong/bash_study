#!/bin/bash

#将错误输出重定向到$0.log中去
exec 2>/tmp/$0.log
#打开01text作为输入文件,将其绑定到3号描述符中
exec 3<01text

echo "111111111"
# 将22222222 输出到错误输出中, >&2一定要连着写没有空格
echo "222222222" >&2

#从3号描述符中读取输入
read name rank serno <&3  
printf "name:%s\trank:%s\tserno:%s\n" $name $rank $serno

#关闭描述符
exec 5>&-

