#!/bin/bash

#  整数运算:  $(( )) 能提简单的算数展开
echo $((1+2))
echo $((1-2))
echo $((1*2))
echo $((1/2))
echo $((5%2))


# 常量
FOO=abc
readonly FOO #设置为只读模式
FOO=bcd # 01var_and_env.sh: line 14: FOO: readonly variable
echo FOO=$FOO #abc

#合并写法
readonly FOO_1=abc


# 环境变量  环境变量的好处是子进程也会继承它
FOO_2=bcd
export FOO_2

#合并写法
export FOO_3=abc

sh 01_child.sh
#输出 1是空的原因是FOO_1并没有export
#1:
#2:bcd
#3:abc


