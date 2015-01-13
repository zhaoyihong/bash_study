#!/bin/bash

#  if语句基本写法
#   if [  ]; then
#        do something
#    elif [ ]; then
#        do something
#    else
#        do something
#    fi
#

# 注意的是 [  和 ] 两边都必须是空格

# 和c语言不一样的地方是 if 条件返回0 时,才执行then后面的语句
# 并且命令成功返回0
if [ 0 ] ;then
    echo "0 is success";
else
    echo "0 is fail";
fi

echo 
#判断本文件中是否包含echo
if grep echo $0 > /dev/null ;then
    echo "$0 include echo" 
else
    echo "$0 not include echo"
fi


echo 
# 判断某条命令是否成功执行
# 注意程序的退出状态为0时,表示成功

ls > /dev/null 
if [ $? ] ;then 
    echo "last command success"
else
    echo "fail"
fi

ls > /dev/null && echo "last command success"

echo 
# test表达式
# 常用的
# -e 文件是否存在 ,  -s 文件不是空的 
# -r -w -x 读 写 执行
# -n string 不是空的, -z string是空的
# s1 == s2  字符串相等 ,!= 字符串不等
# -a and, -o or
# -ne -eq -lt -gt 等算数比较

if [ -e README ];then
    echo "README exist"
fi

if [ -s README ]; then
    echo "README is not null"
fi

str1="abcd"
str2=
if [ -n "$str1" ];then
    echo "string str1 is not null"
fi
if [ -z "$str2" ];then
    echo "string str2 is  null"
fi


str3="abcd"

if [ "X$str1" != "X$str2" ];then
    echo "str1 != str2"
fi

# 感觉 == 和 = 都可以
if [ "X$str1" = "X$str3" ];then
    echo "str1 == str3"
fi

# -a -o 和 && || 不同的地方
if [ -e README ] && [ -w README ];then
    echo "README is exist and  writable" 
fi

if [ -e README -a -w README ];then
    echo "README is exist and  writable" 
fi

echo "test 的注意点:"
echo "1 需要参数, test中的变量一定要打上引号,否则若变量为空,则没有参数了.  if [ -e \"\$file\" ] "
echo "2 字符串比较, 使用 if [ \"X\$answer\" = \"X\$yes\" ] ,否则字符串为空或者-开头时可能出错"
echo "3 test 只能做整数测试 "



