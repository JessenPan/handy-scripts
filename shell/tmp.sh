#!/bin/bash

instance1="192.168.102.246_ins1_alter"
instance2="192.168.102.247_ins2_alter"

sqlFile="./add_field.sql"
outputDir="/home/jessenpan/Desktop"

#第一个分库:instance1
ins1=${outputDir}"/"${instance1}".sql"
for i in {0..3}
do 
     sedVar='s/b2b_ware/b2b_ware'${i}'/g'
     sed ${sedVar}  ${sqlFile} >> ${ins1}
done


#第二个分库:instance2
ins2=${outputDir}"/"${instance2}".sql"
for i in {4..7}
do 
     sedVar='s/b2b_ware/b2b_ware'${i}'/g'
     sed ${sedVar}  ${sqlFile} >> ${ins2}
done 


