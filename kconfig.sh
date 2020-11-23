#!/bin/bash
#使用方式：（脚本名）（linux源码顶层目录）（config 配置选项名）
a=$(find $1 -name "Kconfig"|xargs grep -inw "$2")
#搜索所有Kconfig找到匹配选项
b=${a%:*}
c=${b%:*}
#echo $c
#c:筛选grep找到的目录
d=${b#*:}
#echo $d
#d:筛选grep找到的行数
g=$(tail -n +$d $c|head -n 100|grep -in  "help"|sed -n '1p')
#echo $g
#g:确定help所在行(相对config行数）
h=${g%:*}
#echo $h
#h:筛选g
e=$(tail -n +$d $c|head -n 100|grep -inw "^config"|sed -n '2p')
#e:确定下一个config开头的行数
f=${e%:*}
#f:筛选e
i=$(expr $d + $h)
#i:把需要查找的config行数与help行数相加得到绝对行数
j=$(expr $f - $h)
#j:把下一个config行数与help行数相减得到相对行数（相对于help)
tail -n +$d $c|head -n $h
#显示config到help之间的内容（带换行符）
echo $(tail -n +$i $c|head -n $j)
#显示help到下一个config的内容(不带换行符)
