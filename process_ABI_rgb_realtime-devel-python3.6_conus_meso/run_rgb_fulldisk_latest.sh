#!/bin/bash

export PATH="/home/poker/miniconda3/envs/goes16_201710/bin/:$PATH"

cd /home/poker/goes16_ralph/process_ABI_rgb_realtime-devel-python3.6_conus_meso

cp /home/ldm/data/grb/fulldisk/03/latest.nc /dev/shm/latest_fulldisk_03.nc
cmp /home/ldm/data/grb/fulldisk/03/latest.nc /dev/shm/latest_fulldisk_03.nc > /dev/null
CONDITION=$?
#echo $CONDITION

while :; do

  until [ $CONDITION -eq 1 ] ; do
#     echo same
     sleep 5
     cmp /home/ldm/data/grb/fulldisk/03/latest.nc /dev/shm/latest_fulldisk_03.nc > /dev/null
     CONDITION=$?
  done
#  echo different
  sleep 60
  cp /home/ldm/data/grb/fulldisk/03/latest.nc /dev/shm/latest_fulldisk_03.nc
  /home/poker/miniconda3/envs/goes16_201710/bin/python process_ABI_test_one_fulldisk_latest.py
  cmp /home/ldm/data/grb/fulldisk/03/latest.nc /dev/shm/latest_fulldisk_03.nc > /dev/null
  CONDITION=$?
#  echo repeat

done

