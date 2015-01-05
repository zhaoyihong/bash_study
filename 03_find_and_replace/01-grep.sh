#!/bin/bash

echo "grep 是文本查找工具，会将文本中匹配正则表达式的行打印出来"
echo "基本用法:"
echo "grep 'xxx' filename 只打印匹配的行"
echo "grep 'xxx' * 打印匹配的文件和行" 

echo ""
echo 查找hello
grep 'hello' 01text

echo 查找固定字符串h.llo
grep -F 'h.llo' 01text
grep 'h\.llo' 01text

echo 不分大小写查找hello
grep -i 'hello' 01text

echo "在当前目录下查找"
grep 'hello' *
echo 只打印匹配的文件名
grep -l 'hello' *

echo 静默查找
grep -q 'hello' *

echo "ERE 和BRE的区别是多出来的 ? + | 以及不用\的()和{}"

echo 扩展正则表达式
grep -E 'he+llo' 01text

echo "BRE ERE 对比"
grep -E 'he{3}llo' 01text
grep 'he\{3\}llo' 01text

