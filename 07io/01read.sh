#!/bin/bash

# 默认分隔符是\n,\t或者空格
# read默认将\视作续行符,如果使用-r命令将会把反斜杠视作转义符
printf "Enter name,rank,serialname\n"
read name rank serialname
printf "name=%s,rank=%s,serialname=%s\n" $name $rank $serialname
echo 

# IFS=: 只对read有效, while 判断read的返回值
# < /etc/passwd 只可以放在done的后面,这样每次才读取下一行
while IFS=: read user pass uid gid fullname homedir shell
do
    printf "user:%s\thomedir=%s\n" $user $homedir 
done < /etc/passwd 




