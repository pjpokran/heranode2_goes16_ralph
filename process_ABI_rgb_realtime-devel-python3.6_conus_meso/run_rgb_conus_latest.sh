#!/bin/bash

export PATH="/home/poker/miniconda3/envs/goes16_201710/bin/:$PATH"

cd /home/poker/goes16_ralph/process_ABI_rgb_realtime-devel-python3.6_conus_meso

cp /home/ldm/data/grb/conus/03/latest.nc /dev/shm/latest_conus_03.nc
cmp /home/ldm/data/grb/conus/03/latest.nc /dev/shm/latest_conus_03.nc > /dev/null
CONDITION=$?
#echo $CONDITION

while :; do

  until [ $CONDITION -eq 1 ] ; do
#     echo same
     sleep 5
     cmp /home/ldm/data/grb/conus/03/latest.nc /dev/shm/latest_conus_03.nc > /dev/null
     CONDITION=$?
  done
#  echo different
  echo '##############  NEW FILE ##################'
  date
  sleep 25

  echo 'START COPY'
  date
  cp /home/ldm/data/grb/conus/03/latest.nc /dev/shm/latest_conus_03.nc
  cp /home/ldm/data/grb/conus/02/latest.nc /dev/shm/latest_conus_02.nc
  cp /home/ldm/data/grb/conus/01/latest.nc /dev/shm/latest_conus_01.nc
  echo 'DONE COPY'
  date
  /home/poker/miniconda3/envs/goes16_201710/bin/python process_ABI_test_one_latest.py
  echo 'DONE PLOTTING'
  date
  cmp /home/ldm/data/grb/conus/03/latest.nc /dev/shm/latest_conus_03.nc > /dev/null
  CONDITION=$?
#  echo repeat

done

