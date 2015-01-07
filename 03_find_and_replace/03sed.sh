#!/bin/bash
#   sed 用法
#   -n 默认不打印，有需要在处理命令后加p打印
#   -e 使用多条处理命令时 每条命令前面加-e
#   -f 在script-file中处理编辑命令
#   sed每次读取文件中的一行，假如没有文件，则从标准输入中获取

# 将/home/yihong中目录结构在/home/yh中建立一遍
# sudo mkdir /home/yh/
# find /home/yihong/ -type d -print | sed 's#/home/yihong/#/home/yh/#g'  | sed 's/^/mkdir /' | sudo  sh -x'

echo "1 sed可以用任意字符作为分隔符，在替换/时记得使用其他字符，以免需要转义"
echo "/home/yihong/socket/" | sed 's/\/home\/yihong\//\/home\/yh\//'
echo "/home/yihong/socket/" | sed 's#/home/yihong/#/home/yh/#' 
echo "/home/yihong/socket/" | sed 'sA/home/yihong/A/home/yh/A' 

echo "2 sed 向后引用 ,sed使用的regex BRE,所以使用括号是要加反斜线的"
echo "/home/yihong/socket/" | sed 's#\(/home/\)yihong/#\1yh/#' 

echo "3 sed中&表示正则表达式匹配打牌的整个文本"
echo "/home/yihong/socket/" | sed 's#\(/home/\)yihong/#&->\1yh/#' #打印出替换的规则 
echo "hello world" | sed 's/hello/(&)/'  #将匹配到的用括号括起来
echo "hello hillo" | sed 's/h[ie]llo/(&)/g'  #&与多个匹配

echo "4 全局替换与定点替换"
echo "hello hello hello" | sed 's/hello/hillo/' #默认替换第一个匹配项 
echo "hello hello hello" | sed 's/hello/hillo/g'  #替换所有匹配项
echo "hello hello hello" | sed 's/hello/hillo/2'  #替换第指定个匹配项

echo "5 打印与否"
echo -e "hello world\nabcde" | sed 's/hello/hillo/' #默认不管是否匹配到都打印
echo ""
echo -e "hello world\nabcde" | sed -n 's/hello/hillo/' #默认什么都不打印
echo ""
echo -e "hello world\nabcde" | sed -n 's/hello/hillo/p' #只打印被替换项

echo "6 指定行"
echo "6.1指定行号"
echo "打印2-6行"
sed -n '2,6p' 03text
echo "将第3行中的o改成e"
sed '3 s/o/e/g' 03text  

echo "6.2正则匹配,只处理匹配到的行"
echo "添加注释"
sed '/oldfunc/ s/$/ # XXX:migrate to new func/g' 03text
echo "s的空模式意思是:前一个匹配项" 
sed '/Tolsoty/ s//& and Camus/' 03text
echo "正则匹配的范围"
echo "打印匹配到aaaa 和 匹配到oldfunc的行之间的行，下面的打印了两段"
sed -n '/aaaa/,/oldfunc/p' 03text 
echo "否定正则表达式,打印不包含oldfunc的行"
sed -n '/oldfunc/! p' 03text

echo "7 q表示退出"
echo "下面的例子表示到了第三行执行退出,等同于打印前3行"
sed '3q' 03text

echo "8 sed替换范围，选区最长的"
echo "Tolsoty is worldly" | sed 's/T.*y/Camus/' # Camus
echo "Tolsoty is worldly" | sed 's/T[[:alpha:]]*y/Camus/' #Camus is worldly


