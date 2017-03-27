#!/bin/bash

instance1="10.191.203.89_ins1_alter"
instance2="10.191.203.78_ins2_alter"
instance3="10.191.203.75_ins3_alter"
instance4="10.191.28.199_ins4_alter"

sqlFile="./add_field.sql"
outputDir="/home/jessenpan/Desktop"

#第一个分库:instance1
ins1=${outputDir}"/"${instance1}".sql"
for i in {0..31}
do 
     sedVar='s/b2b_ware/b2b_ware'${i}'/g'
     sed ${sedVar}  ${sqlFile} >> ${ins1}
done


#第二个分库:instance2
ins2=${outputDir}"/"${instance2}".sql"
for i in {32..63}
do 
     sedVar='s/b2b_ware/b2b_ware'${i}'/g'
     sed ${sedVar}  ${sqlFile} >> ${ins2}
done 

#第三个分库:instance3
ins3=${outputDir}"/"${instance3}".sql"
for i in {64..95}
do 
     sedVar='s/b2b_ware/b2b_ware'${i}'/g'
     sed ${sedVar}  ${sqlFile} >> ${ins3}
done 

#第四个分库:instance4
ins4=${outputDir}"/"${instance4}".sql"
for i in {96..127}
do 
     sedVar='s/b2b_ware/b2b_ware'${i}'/g'
     sed ${sedVar}  ${sqlFile} >> ${ins4}
done 


