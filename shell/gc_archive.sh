#!/bin/bash

#########################################
### @author jessenpan     ###############
### @date   2018-1-19     ###############
### @desc   压缩gc   ##############
########################################

stopDateTime=`date +%Y%m%d_%H_%M_%S`

gcLogBasePath='/export/Logs/b2b-ware-vision.jd.local/'
gcFileName='gc.log'

zipedGcFileName=${stopDateTime}'_'${gcFileName}'.zip'

echo "gcLogBasePath:" ${gcLogBasePath}
echo "gcFileName:" ${gcFileName}
echo "zipedGcFileName:" ${zipedGcFileName}

zip "${gcLogBasePath}${zipedGcFileName}" "${gcLogBasePath}${gcFileName}"
