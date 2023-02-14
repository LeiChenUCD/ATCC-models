#!/bin/bash
# Job name:
#SBATCH --job-name=wlasl_2_12
#
# Account:
#SBATCH --account=ic_barskyatg
#
# Partition:
#SBATCH --partition=savio2_1080ti
#
# Number of nodes:
#SBATCH --nodes=1
#
# Number of tasks (one for each GPU desired for use case) (example):
#SBATCH --ntasks=1
#
# Processors per task:
# Always at least twice the number of GPUs (savio2_gpu and GTX2080TI in savio3_gpu)
# Four times the number for TITAN and V100 in savio3_gpu
# Eight times the number for A40 in savio3_gpu
#SBATCH --cpus-per-task=2
#
#Number of GPUs, this can be in the format of "gpu:[1-4]", or "gpu:K80:[1-4] with the type included
#SBATCH --gres=gpu:1
#
# Wall clock limit:
#SBATCH --time=08:00:00
#
## Command(s) to run (example):
module load python
module load cuda/11.2
module load gcc/12.1.0
python -m train --experiment_name "ATCC" --training_set_path "WLASL100_train_25fps.csv" --validation_set_path "WLASL100_val_25fps.csv" --testing_set_path "WLASL100_test_25fps.csv"