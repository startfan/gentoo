#!/bin/bash
a=$(find $1 -name "Kconfig"|xargs grep -inw -E "config $2|menuconfig $2"|awk -F":" 'NR==1 {print $1,$2}')
echo $a
b=${a% *}
#echo $b
c=${a#* }
#echo $c
d=$(tail -n +$c $b|head -n 100|grep -in  "help"|awk -F ":" 'NR==1 {print $1}')
#echo $g
e=$(tail -n +$c $b|head -n 100|grep -inw "^config"|sed -n '2p')
#echo $e
f=${e%:*}
g=$(expr $c + $d)
#d=$(($d+1))
#sed -n "$c,($d)p" $b
tail -n +$c $b|head -n $d
if [ -n "$e" ] ;then
j=$(expr $f - $d)
echo $(tail -n +$g $b|head -n $j)
else
	echo $(tail -n +$g $b)
fi
