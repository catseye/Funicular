#!/bin/sh

. ./Funicularfile

DRIVER_DIR=`dirname $0`
. ${DRIVER_DIR}/fu-platform-${PLATFORM}.sh

# soon this will not call the platform_ directly, instead there will be wrapper functions
CMD=$1
shift
platform_$CMD $*
