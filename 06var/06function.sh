#!/bin/bash


wait_for_user()
{
    until who | grep "$1" > /dev/null 
    do
        sleep ${2:-30}
    done 
}

#wait_for_user zhao 60 #等待用户zhao,每60秒检查一次
#wait_for_user zhao  #等待用户zhao,每30秒检查一次

equal()
{
    case "$1" in
        "$2")
            return 0
            ;;
    esac

    return 1
}

if equal "abc" "abc"  ;then
    echo "equal"
else
    echo not equal
fi


