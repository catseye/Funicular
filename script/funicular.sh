#!/bin/sh

# This will need to `export` any variables that fu-platform-___.sh will need to see
. ./Funicularfile

MY_DIR=`dirname $0`

${MY_DIR}/fu-platform-${PLATFORM}.sh $*
