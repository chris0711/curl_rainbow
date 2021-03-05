#!/bin/bash -l
 
# Slurm parameters
#SBATCH --job-name=bo_v2curl
#SBATCH --output=curl_breakout_name%j.%N.out
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=4
#SBATCH --time=60:00:00
#SBATCH --mem=16G
#SBATCH --gpus=1
#SBATCH --qos=batch
 
# Activate everything you need
module load cuda/11.1
pyenv activate curl
# Run your python code
python main.py --game breakout --checkpoint-interval 100000 --T-max 10000000 --memory ./results/memory/latest.pth

