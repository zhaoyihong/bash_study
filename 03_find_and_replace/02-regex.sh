#!/bin/bash
echo "正则表达式有两种：BRE ERE"
echo "ERE去除了\(\) \{\} 的反斜杠，增加了 ? + |"
echo 'BRE,ERE两者都可用的有\ . * ^ $ [...] \x'
echo 'BRE 私有 \{m,n\} \( \)'
echo 'ERE 私有 {m,n} () ? + |'
echo ""
echo "grep使用BRE,但可以通过grep -E 来使用ERE"
echo "sed使用BRE"
echo "gawk使用ERE"
echo "------------使用示例--------------------"
echo ""
echo "[...]符号使用,单字符匹配" 
grep 'ab[ch]de' 02text
echo "[]中取反 [^ch]"
grep 'ab[^ch]de' 02text
echo "由于[...]是用于单字符匹配的，所以POSIX字符集都必须使用[[ ]]"
grep '[[:digit:]]' 02text
echo ""
echo ""
echo "后向引用 :使用\(\)阔住需要重复的正则表达式："
echo "匹配abcdwcdab"
grep '\(ab\)\(cd\)w\2\1' 02text 
echo "匹配两个wny"
grep '\(why\).*\1' 02text
echo "匹配引号括起来词"
grep "\(['\"]\)[[:alpha:]]*\1" 02text
echo ""
echo '单双引号区别:双引号中的保留元字meta功能开关，单引号中关闭了'
A=123
echo '$A'
echo "$A"
echo "输出双引号 \""
echo "echo '\'' 单引号中关闭了无法转义，所以输不出单引号 "
echo '但是单引号中能够使用转移输出\\' 
echo ""
echo "锚点的使用 ^ $"
echo -n "b结尾的:"
grep 'b$' 02text
echo  "a开头的:"
grep '^a' 02text
echo "删除空行"
grep -v '^$' 02text
echo ""
echo "前置单个字符重现的表达式"
echo "1 使用\{\}"
echo "1-3个9"
grep '9\{1,3\}' 02text 
echo "连续5个或者5个以下数字"
grep '[[:digit:]]\{1,5\}' 02text
echo "使用* 表示0个或者多个字符"
echo "8后面0个或者多个9"
grep "89*" 02text
echo ""
echo "*在首位，BRE中表示*原义，ERE中表示无意义"
echo "BRE:中匹配到*abc"
grep "*abc" 02text
echo "ERE:中匹配到abc"
grep -E "*abc" 02text
echo ""
echo "ERE的用法"
echo ""
echo "1 没有\的{}"
grep -E '9{1,5}' 02text
echo ""
echo "2 没有\的()"
grep -E "(['\"])[[:alpha:]]+\1" 02text
echo ""
echo "3 ?:0个或者1个 +1个或者多个"
echo "89?:"
grep -E '89?' 02text 
echo "89+:"
grep -E '89+' 02text
echo ""
echo "4 | 交替出现"
grep -E 'abc|why' 02text
echo "read write 空格交替出现"
grep -E '(read|write|[[:space:]]+)+' 02text
echo "一个或者多个why"
grep -E '(why)+' 02text
echo ""
echo "单词边界"
grep '\<abc\>' 02text
