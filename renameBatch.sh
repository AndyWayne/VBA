#!/bin/bash

#Author: Andy Wayne
#E-mail: andy.wayne@foxmail.com
#Function: Rename the files in batch

TARDIR="new"

#Function for change the name of the files in batch.
function renameBatch(){
  j=1;
  for i in `find ./ -type f -name "info_*"`; do
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
else
  mkdir $TARDIR;
  renameBatch;
  echo "All the files are moved to ${TARDIR}."
fi

