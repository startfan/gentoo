#!/bin/bash
#使用方式：（脚本名）（linux源码顶层目录）（config 配置选项名）
a=$(find $1 -name "Kconfig"|xargs grep -inw -E "config $2|menuconfig $2"|awk -F":" 'NR==1 {print $1,$2}')
echo $a
#搜索所有Kconfig找到匹配选项
b=${a% *}
#echo $b
c=${a#* }
#echo $c
#b:筛选grep找到的目录
#c:筛选grep找到的行数
d=$(tail -n +$c $b|head -n 100|grep -in  "help"|awk -F ":" 'NR==1 {print $1}')
#echo $g
#d:确定help所在行(相对config行数）
e=$(tail -n +$c $b|head -n 100|grep -inw "^config"|sed -n '2p')
#echo $e
#e:确定下一个config开头的行数
f=${e%:*}
#f:筛选e
g=$(expr $c + $d)
#g:把需要查找的config行数与help行数相加得到绝对行数
#d=$(($d+1))
#sed -n "$c,($d)p" $b
tail -n +$c $b|head -n $d
#显示config到help之间的内容（带换行符）
if [ -n "$e" ] ;then
j=$(expr $f - $d)
#j:把下一个config行数与help行数相减得到相对行数（相对于help)
echo $(tail -n +$g $b|head -n $j)
else
	echo $(tail -n +$g $b)
fi
#显示help到下一个config的内容(不带换行符)
