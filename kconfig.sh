#!/bin/bash
#ʹ�÷�ʽ�����ű�������linuxԴ�붥��Ŀ¼����config ����ѡ������
a=$(find $1 -name "Kconfig"|xargs grep -in "$2"|awk -F":" 'NR==1 {print $1,$2}')
echo $a
#��������Kconfig�ҵ�ƥ��ѡ��
b=${a% *}
#echo $b
c=${a#* }
#echo $c
#c:ɸѡgrep�ҵ���Ŀ¼
d=$(tail -n +$c $b|head -n 100|grep -in  "help"|awk -F ":" 'NR==1 {print $1}')
#echo $g
#d:ȷ��help������(���config������
e=$(tail -n +$c $b|head -n 100|grep -inw "^config"|sed -n '2p')
#echo $e
#e:ȷ����һ��config��ͷ������
f=${e%:*}
#f:ɸѡe
g=$(expr $c + $d)
#g:����Ҫ���ҵ�config������help������ӵõ���������
#j=$(expr $f - $d)
#d=$(($d+1))
#sed -n "$c,($d)p" $b
tail -n +$c $b|head -n $d
#��ʾconfig��help֮������ݣ������з���
if [ -n "$e" ] ;then
j=$(expr $f - $d)
#j:����һ��config������help��������õ���������������help)
echo $(tail -n +$g $b|head -n $j)
else
	echo $(tail -n +$g $b)
fi
#��ʾhelp����һ��config������(�������з�)
