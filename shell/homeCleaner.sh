#!/bin/bash

defaultCleanExt="data;properties"
minDepth=1
maxDepth=1
cd ~
find .  -minDepth ${minDepth} -maxDepth ${maxDepth} -name "*."${defaultCleanExt}
xargs rm


