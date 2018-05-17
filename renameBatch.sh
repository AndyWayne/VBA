#!/bin/bash

########################################
# Author: Andy Wayne                   #
# Date: 2018-05-17                     #
# E-mail: andy.wayne@foxmail.com       #
########################################

TARDIR="new"
arg1=$1

function renameBatch(){
  j=1;
  for i in `find ./ -type f -name "${arg1}"`; do
    if [ $j -le 9 ]; then
      cp $i ./${TARDIR}/info-000$j.log;
    elif [ $j -le 99 ]; then
       cp $i ./${TARDIR}/info-00$j.log;
    elif [ $j -le 999 ]; then
      cp $i ./${TARDIR}/info-0$j.log;
    elif [ $j -le 9999 ]; then
      cp $i ./${TARDIR}/info-$j.log;
    fi
    ((j++));
  done
}

if [ -d ${TARDIR} ];then
  echo "The ${TARDIR} directory is exist."
  exit 0;
elif [ -z $1 ]; then
  echo "Usage: renameBatch [Option]"
  exit 0;
else
  mkdir $TARDIR;
  renameBatch;
  echo "All the files are moved to ${TARDIR}."
fi
