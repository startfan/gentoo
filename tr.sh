#!/bin/bash
t=2
a=0
IFS=$'\n'
while [ $a -le $t ]
do
$(transmission-remote -t 4 -tr $a)
let 'a++'
done
