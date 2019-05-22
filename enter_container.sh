###################################################################
#
# Purpose: Start the Singularity container
#
# Usage: ./enter_container.sh [script]
#
#  [script]: Optional argument to run a script instead of enter bash shell
#
# Description of arguments below: 
#
#     --bind: Let the given directory be visible inside container
#             (Note: needs to be absolute path, not symlink)
#
#     --nv: Enable GPU access
#
#     bash: Start a bash shell (instead of just executing a command)
#
####################################################################

module load singularity/2.6

SCRIPT_TO_RUN=/bin/bash
if [[ $1 != "" ]]; then
	SCRIPT_TO_RUN=$1
fi

CONTAINER_PATH=/project/def-tafirout/wfedorko/baseml-v0.2.simg
CDIR=`readlink -f ${PWD}`
DATA_DIR=`readlink -f /scratch/wfedorko`

SINGULARITYENV_SLURM_SUBMIT_DIR=$SLURM_SUBMIT_DIR singularity exec --nv --bind ${CDIR} --bind ${DATA_DIR} ${CONTAINER_PATH} ${SCRIPT_TO_RUN}
