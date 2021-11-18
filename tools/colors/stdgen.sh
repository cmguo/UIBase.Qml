#/bin/bash

TOOLS=`dirname $0`

awk -f ${TOOLS}/stdgen.awk ${TOOLS}/$1/stdcolors.txt UIBase/$1/colors.h > temp
mv temp UIBase/$1/colors.h
