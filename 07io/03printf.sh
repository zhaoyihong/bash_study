#!/bin/bash
#printf 和 c语言中的printf语法类似,区别是 没有括号
#  printf format "string ..."
#  format 中的转义字符会被转义,但是参数中的转义字符不会被转义
#       想使参数中的转义字符生效用%b
#  参数之间用空格分割


# %b参数中的转义词生效
# %c 字符
# %d %i 十进制整数
# %e %E 浮点数 
# %f 浮点数
# %o 八进制
# %x 十六进制
# %s 字符串

#字宽
#十个字符宽度,如果不够就补充,够宽度或者超过宽度就原样打印
printf "|%10s|\n" "hello"
printf "|%10s|\n" "helloooooooooooooo"

#对齐
#设置为左对齐(默认右对齐)
printf "|%-10s|\n" "hello"

#精度
#%s 字符串最大长度,多出来的截断
printf "|%.10s|\n"  "hello"
printf "|%.10s|\n"  "hellooooooooooooo"
#%d 打印的最小位数,不够的打0
printf "|%.5d|\n" 1234567890
printf "|%.5d|\n" 1234
# %f小数点右边最小位数,不够的打0
printf "|%.5f|\n"  123456.123456
printf "|%.5f|\n"  123456.12

#如果第一个字符是单引号,则会被视作是字符
printf "%c is %d" a "'a"



