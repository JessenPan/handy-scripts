#!/bin/bash

#####################################
#####################################
### author:jessenpan
### date:2016-04-13 
### description:切换本机上的jdk版本
#####################################
#####################################

linkedJdkPath="/work/applications/jdk"

# ensure the file cteated has the writable priority
umask 000

if [ $# -lt 1 ] ; then
    echo "you should specify the targedJdk version number!";
    exit 1;
fi


targedJdkVersionNum=$1
## need to add " that to ensure the ${2} is string
if [ -n "${2:-}" ] ; then
    linkedJdkPath="$2"
fi

if [ -a  ${linkedJdkPath} ] ; then
    if [ -w ${linkedJdkPath} ] ; then
        rm -v ${linkedJdkPath}
        [ $? -ne 0 ] && exit 1
    else
        echo "doesnot have the permission to delete previous link file:${linkedJdkPath}"
        exit 1
    fi
fi
    
jdkInstallDir=$(dirname "${linkedJdkPath}")
targedPatternJdkVersion="jdk1."${targedJdkVersionNum}

patternedJdk=$(ls -l ${jdkInstallDir}|awk '{print $NF}'|grep "^${targedPatternJdkVersion}"|head -n 1)

if [ -z "${patternedJdk:-}" ] ; then
    echo " cannot find targed version 1."${targedJdkVersionNum}" jdk, please make sure that jdk exists! "
    exit 1
fi

fullPathJdk=${jdkInstallDir}"/"${patternedJdk}
ln -s -v ${fullPathJdk} ${linkedJdkPath}

echo "jdk js switch successfully,current jdk version is 1."${targedJdkVersionNum}
echo "=====java version detail info===="
java -version
