#!/bin/bash
# sort的常用用法

echo "sort 默认对行排序"
sort 01text
echo ""

echo "sort 按字段排序 "
echo "-k 字段号 -t 分隔符"
echo "对01text按第二列排序以整数序反序排序"
echo "-n 字母序排序 -r反序"
sort -k2rn 01text
echo ""

echo "-u 清除重复项"
sort -k1 -u 01text
echo ""

echo "对/etc/passwd按第一序列的第三个字符开始,到第二个序列的第二个字符截止排序"
echo "-ka.b,c.d 从a列的第b个元素 到 第c列的第d个元素"
sort -k1.3,2.2 -t: /etc/passwd 
echo ""


#sort是不稳定的 但可以通过参数--stable进行稳定排序







