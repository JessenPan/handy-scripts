#!/bin/bash

#########################################
### @author jessenpan     ###############
### @date   2018-1-19     ###############
### @desc   计算CPU利用率   ##############
########################################
 
if [ "$1" == "" ]
    then
    echo "must input process id!"
    exit -1;
fi

pid=$1

if [ -n "$2" ] && [ $2 -gt 1 ]
then
    frequency="$2"
fi

function getTotalCpuTime(){

    statLine1=`head -n 1 /proc/stat`

    totalCpuTime=0;
    for timeOfCpu in $statLine1
        do
            if [ "$timeOfCpu" == "cpu" ]
        then      
            :
        else
        ((totalCpuTime=totalCpuTime+timeOfCpu))
        fi
    done
    echo $totalCpuTime;
}

function getProcCpuTime(){

    pidStatLine1=`head -n 1 /proc/$pid/stat`

    #以空格为分隔符，0计数，13为utime,14为stime,15为cutime,16为cstime
    i=0;
    procTotalTime=0;
    for timeOfProc in $pidStatLine1
    do
        if [  "$i" -ge 13  ] && [ "$i" -le 16 ]
        then
            ((procTotalTime=procTotalTime+timeOfProc))
        else
            :
        fi
        ((i=i+1))
    done
    echo $procTotalTime;
}

echo "cpuUsage is:"

while true
do
    totalCpuTime1=`getTotalCpuTime`;
    procCpuTime1=`getProcCpuTime`;
    sleep $frequency;
    totalCpuTime2=`getTotalCpuTime`
    procCpuTime2=`getProcCpuTime`
    ((cpuUsage=(procCpuTime2-procCpuTime1)*100*8/(totalCpuTime2-totalCpuTime1)))
    echo $cpuUsage"%"
done

