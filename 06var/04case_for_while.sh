#!/bin/bash

# 为了不使用多个if 可以使用case语句


#case shfit与选项处理
# shift 删除$@最左边的元素,并且使$#减一


while [ $# -gt 0 ]
do
    case $1 in
        -f | --file)
            file=$2
            shift
            ;;
        -d | --directory)
            directory=$2
            shift
            ;;
        -v | --verbose)
            verbose=$2;
            shift
            ;;
        -*)
            echo $0:$1 unrecognized option >&2
            ;;
        *)
            break #没有定义的参数 直接退出循环
            ;;
    esac
    shift
done

echo file=$file,directory=$directory,verbose=$verbose

echo 
#for循环

for i in $(seq 1 5)
do
    echo $i
done


echo 
#
