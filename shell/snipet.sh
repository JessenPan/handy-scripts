#!/bin/bash

jps |grep -vi 'jps'|awk '{print $1}'|xargs -I {} kill -9 {}
