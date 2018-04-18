#!bin/bash

CURDAY=`date +%Y%m%d`;
LOGFILE=/home/pm_${CURDAY}.log

function writeLog()
{
  msg1="$1"
  msg2="$2\n"
  printf "[`date '+%Y-%m-%d %H:%M:%S'`] [$msg1] $msg2"
}

function cpuCollect()
{
  writeLog "INFO" "Starting gather CPU informations!"
  printf "[`date '+%Y-%m-%d %H:%M:%S'`] CPU information:\n" >> ${LOGFILE}
  top -b -n 1 | grep Cpu >> ${LOGFILE};
  echo "" >> ${LOGFILE}
  writeLog "INFO" "Ending gather CPU informations!"
}

function memCollect()
{
  writeLog "INFO" "Starting gather memory informations!"
  printf "[`date '+%Y-%m-%d %H:%M:%S'`] Memory&Swap information:\n" >> ${LOGFILE}
  free | head -n 2 >> ${LOGFILE};
  free | grep Swap >> ${LOGFILE};
  echo "" >> ${LOGFILE}
  writeLog "INFO" "Ending gather memory informations!"
}

function ioCollect()
{
  writeLog "INFO" "Starting gather I/O informations!"
  printf "[`date '+%Y-%m-%d %H:%M:%S'`] I/O information:\n" >> ${LOGFILE}
  iostat -x | grep Device >> ${LOGFILE};
  iostat -x | grep "^sd" >> ${LOGFILE}
  echo "" >> ${LOGFILE}
  writeLog "INFO" "Ending gather I/O informations!"
}

function collect()
{
  cpuCollect;
  memCollect;
  ioCollect;
}

if [ ! -e ${LOGFILE} ];
then
touch ${LOGFILE};
fi

collect;
