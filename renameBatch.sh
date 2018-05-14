#!/bin/bash

#Author: Andy Wayne
#E-mail: andy.wayne@foxmail.com
#Function: Rename the files in batch

j=1;
for i in `find ./ -type f -name "info_*"`; do
  if [ $j -le 9 ]; then
    cp $i /home/temp/info-000$j.log;
  elif [ $j -le 99 ]; then
    cp $i /home/temp/info-00$j.log;
  elif [ $j -le 999 ]; then
    cp $i /home/temp/info-0$j.log;
  elif [ $j -le 9999 ]; then
    cp $i /home/temp/info-$j.log;
  fi
  ((j++));
done
