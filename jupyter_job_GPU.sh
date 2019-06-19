#!/bin/bash
########################################################
# 
# Purpose: Job submission script for starting a Jupyter Notebook server
#
# Usage: sbatch start_jupyternotebook.sh
#
# Description: This will submit a job that then enters a Singularity
#              container and starts a Jupyter Notebook server.
#
#              Make your own copy if you want to modify resources.
#
#              When the job starts, it will output a log file:
#                  log-jupyter-${USER}-${JOBID}.txt
#              that contains instructions for creating an ssh 
#              tunnel locally, and the notebook server URL for
#              pasting into your local browser.
#
# Reference: https://docs.computecanada.ca/wiki/Using_GPUs_with_Slurm
#
# Or interactive test job with: 
#          salloc -c 4 --mem 32000M --gres=gpu:1
#
########################################################

#SBATCH --job-name=notebook

#SBATCH --gres=gpu:1              # Number of GPU(s) per node
#SBATCH --cpus-per-task=4        # CPU cores/threads
#SBATCH --mem=16000M              # memory per node
#SBATCH --time=0-06:00            # time (DD-HH:MM)



#SBATCH --output=log-jupyter-%u-%J.txt
#SBATCH --error=log-jupyter-%u-%J.txt

CDIR=`readlink -f ${PWD}`

${CDIR}/enter_container.sh ${CDIR}/start_jupyternotebook.sh

#sleep 6000
