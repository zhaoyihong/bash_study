#!/bin/bash
#参数展开


#替换运算符

#${varname:-word} 如果未定义或者为null,则返回word        -- 用来返回默认值

#${varname:=word} 如果未定义或者为null,则设置其值为word  -- 用来设置默认值

#${varname:?word} 如果未定义或者为nnull,则提示错误且退出  -- 测试是否未定义,错误则退出

#${varname:+word} 如果已定义,则返回word                 --  用来测试是否已定义



# ${varname:-word}  和 ${varname:=word}  这种使用的最多
filename=${1:-/dev/tty} #当参数1不存在或者为null时,返回/dev/tty
echo $filename


echo ""
#type2 模式展开运算符
path=/home/tolstoy/mem/long.file.name
# 注意这里的pattern不是正则,是bash通配符
# 所谓bash通配符有 *任意多个任意字符 ?一个任意字符 [ ]一个括号内的字符 [^ ]一个非括号内的字符 

#   ${variable#pattern} 如果pattern匹配变量的开头处,则删除匹配的最短部分
echo ${path#/*/} #tolstoy/mem/long.file.name

#   ${variable#pattern} 如果pattern匹配变量的开头处,则删除匹配的最长部分
echo ${path##/*/} #long.file.name   -- 文件名

#   ${variable%pattern} 如果pattern匹配变量的结尾处,则删除匹配的最短部分
echo ${path%.*} #  /home/tolstoy/mem/long.file      --去除后缀
#注意.不是bash通配符,表示点这个符号
echo ${path%/*} # /home/tolstoy/mem  --目录名 

#   ${variable%%pattern} 如果pattern匹配变量的结尾处,则删除匹配的最短部分
echo ${path%%.*} # /home/tolstoy/mem/long 

#  ${#variable} $variable的长度
echo ${#path} #32 


# $# 参数个数
# $@ 命令行参数 ,置于双引号内时,会展开为个别参数
# $* 命令行参数,置于双引号内时,展开为唯一参数 
# $$ 进程号
# $? 上一条命令返回值
# $! 最近一个后台命令的进程号
# $0 应用程序名
# PWD 当前目录

function f1()
{
    echo $#
    echo "$@"
    echo "$*"

    for i in $@
    do
        echo $i
    done

    echo $PWD
}

f1 a b c d




