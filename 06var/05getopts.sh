#!/bin/bash

# 第一个参数用:表示任意参数,这样getopt在遇到除了fvq之外的参数不会报错,而转入'?')的处理
# f:表示f后面有参数,在所有在有参数的编号后面写:
# vq后面没有参数,使用使可以 -vq 这样堆叠

# 每次更新opt 同时更新OPTARG
# OPTIND 表示下一个要处理的参数的编号,getopt处理完后,应将OPTIND设置为1


while getopts :f:vq opt
do
    case "$opt" in 
        f)
            file=$OPTARG
            ;;
        v)
            verbose=true
            ;;
        q)  
            quit=true
            ;;
        '?')
            echo $0:invalid option $OPTARG >&2
            echo "usage: $0 -f [file] -vq [files]" >&2
            exit 1
            ;;
    esac
done

echo $#,$OPTIND
shift $(($OPTIND -1 ))
echo $#
echo file=$file,verbose=$verbose,quit=$quit


