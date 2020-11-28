#!/bin/bash
a=740
b=920
while [ $a -lt $b ]
do
$(wget https://youku.cdn7-okzy.com/20200414/18733_b7680fb1/1000k/hls/05ce00d1001000$a.ts &)
let 'a++'
done
