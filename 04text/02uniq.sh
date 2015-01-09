#!/bin/bash
#uniq 对已序文件进行去重,未排序的是不去重的
echo "排序并去重"
sort 02text | uniq

echo "显示计数"
sort 02text | uniq -c 

echo "显示重复的"
sort 02text | uniq -d 

echo "显示未重复的"
sort 02text | uniq  -u

