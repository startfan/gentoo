#!/bin/bash
#ʹ�÷�ʽ�����ű�������linuxԴ�붥��Ŀ¼����config ����ѡ������
a=$(find $1 -name "Kconfig"|xargs grep -inw "$2")
#��������Kconfig�ҵ�ƥ��ѡ��
b=${a%:*}
c=${b%:*}
#echo $c
#c:ɸѡgrep�ҵ���Ŀ¼
d=${b#*:}
#echo $d
#d:ɸѡgrep�ҵ�������
g=$(tail -n +$d $c|head -n 100|grep -in  "help"|sed -n '1p')
#echo $g
#g:ȷ��help������(���config������
h=${g%:*}
#echo $h
#h:ɸѡg
e=$(tail -n +$d $c|head -n 100|grep -inw "^config"|sed -n '2p')
#e:ȷ����һ��config��ͷ������
f=${e%:*}
#f:ɸѡe
i=$(expr $d + $h)
#i:����Ҫ���ҵ�config������help������ӵõ���������
j=$(expr $f - $h)
#j:����һ��config������help��������õ���������������help)
tail -n +$d $c|head -n $h
#��ʾconfig��help֮������ݣ������з���
echo $(tail -n +$i $c|head -n $j)
#��ʾhelp����һ��config������(�������з�)
