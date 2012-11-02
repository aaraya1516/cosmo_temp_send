#!/bin/bash
####################################################
# Please customize these values appropriately:
LOCATION=/home/ubuntu/cosm
# Temperature in Farenheight
VALUE=$( cat /sys/bus/w1/devices/28-0000040d74b7/w1_slave | tail -n1 | awk -F= '{print 9/5*($2/1000)+35 }' )
####################################################
TIME=`/bin/date -u +%FT%TZ`
if [[ "$VALUE" == "" ]]
then
VALUE=0
fi
echo "$TIME,$VALUE" >> $LOCATION/cosm.csv
exit 0
