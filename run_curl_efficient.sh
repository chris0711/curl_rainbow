#!/bin/bash -l
 
# Slurm parameters
#SBATCH --job-name=curl_breakout
#SBATCH --output=da_curl_breakout_name%j.%N.out
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=4
#SBATCH --time=36:00:00
#SBATCH --mem=16G
#SBATCH --gpus=1
#SBATCH --qos=batch
 
# Activate everything you need
module load cuda/10.1
pyenv activate curl
# Run your python code
python main.py --game breakout --checkpoint-interval 100000 --target-update 2000 \
               --T-max 2000000 \
               --learn-start 1600 \
               --memory-capacity 100000 \
               --replay-frequency 1 \
               --multi-step 20 \
               --architecture data-efficient \
               --hidden-size 256 \
               --learning-rate 0.0001 \
               --evaluation-interval 10000
