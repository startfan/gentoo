#!/bin/bash
t=340
a=1
IFS=$'\n'
for i in $(cat /home/tracker)
do
$(transmission-remote -t 4 -td $i)
done
