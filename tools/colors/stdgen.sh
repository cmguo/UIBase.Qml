#/bin/bash

TOOLS=`dirname $0`

awk -f ${TOOLS}/stdgen.awk ${TOOLS}/stdcolors.txt UIBase/uibase/colors.h > temp
mv temp UIBase/uibase/colors.h
