#!/bin/bash
#   cut 用来按列分割文本
# 1 按字符分割 cut -c1 显示每行的第一个字符  cut -c2-10显示每行的2-10个字符
# 2 按field分割，cut -d: -f1 以:为分隔符，显示每行的第一个列
#

echo "显示ls -l的第1-10个字符"
ls -l | cut -c 1-10
echo ""
echo "显示/etc/passwd中以:为分隔符的第一列"
cat /etc/passwd  | cut -d: -f1
echo ""

# join用来连接字段
# join [option] file1 file2
# join默认根据第一列来排序，要求顺序也要一样，才可以合并
# -1 -2 选项是指定按照哪一列合并
# -t 指定分隔符 ,默认是空格

join 04file1 04file2
echo ""
join 04file1 04file3 -1 1 -2 2









