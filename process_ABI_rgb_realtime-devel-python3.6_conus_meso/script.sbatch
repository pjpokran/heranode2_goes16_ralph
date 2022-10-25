#!/bin/bash
# THIS SCRIPT MUST BE SUBMITTED VIA SBATCH
#SBATCH --job-name=ABI-CREFL
#SBATCH --partition=all
#SBATCH --share
#SBATCH --time=1:20:00
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=1
#SBATCH --output=/data/kuehn/scratch/crefl_slurm_log_%A_%a.txt
source activate py27
cd /home/kuehn/work/process_ABI_rgb_realtime
FILE=$(sed -n -e "$SLURM_ARRAY_TASK_ID p" file_list_307b.txt)
#python process_ABI_test.py -k /data/kuehn/ABI/2017_09_13_256/ -i ${FILE}
#python process_ABI_test.py -k /data/kuehn/ABI/2017_08_26_238/ -i ${FILE}
#python process_ABI_test.py -k /data/kuehn/ABI/2017_11_02_306/ -i ${FILE}
python process_ABI_test.py -k /data/kuehn/ABI/2017_11_03_307/ -i ${FILE}
