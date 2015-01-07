#!/bin/bash
#简要awk
# 基本模式 awk 'program' [files...]
# awk 使用ERE 正则表达式
# awk 的基本模式是 pattern {action} ,pattern一般是正则表达式或者行号

#1 NF 表示每行的字段数
echo "打印第一列"
awk '{print $1}' 05text
echo "打印第一列和最后一列"
awk '{print $1,$NF} ' 05text
echo "不打印空行"
awk 'NF>0 {print $0}' 05text
echo "不指定动作,默认为打印"
awk 'NF>0' 05text

#2设定字符分隔符
echo ""
echo "以冒号为字段分隔符,打印/etc/passwd的第一列和第五列"
awk -F":" '{print $1,$5}' /etc/passwd
echo ""
echo "设定输出分隔符"
awk -F":" -vOFS="***" '{print $1,$5}' /etc/passwd

#3 print 和 printf
echo ""
echo "使用print时记得将各个字段用逗号隔开,否则awk会直连所有字段"
awk 'NF>0 {print $1 $2}' 05text
echo ""
echo "使用printf更加灵活,记得\n"
awk -F":" 'NF>0 {printf "user %s is really  %s\n",$1,$5}' /etc/passwd

#4 BEGIN 和 END
#大型程序中是这样的
# BEGIN { start code  }
# pattern1 { action1   }
# pattern2 { action2  }   
# END   { end code  }
echo ""
echo "BEGIN 和 END的用法"
awk 'BEGIN{ print "start" ; FS=":" ; OFS="***" } {print $1,$5} END{ print "end"}' /etc/passwd

