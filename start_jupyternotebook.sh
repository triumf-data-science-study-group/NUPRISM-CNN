########################################################
# 
# Purpose: Script for starting a Jupyter Notebook server
#
# Usage: ./start_jupyternotebook.sh
#
# Reference: https://docs.computecanada.ca/wiki/Jupyter
#
# Adapted from Patrick de Perio's script by W.Fedorko
#
########################################################

# Necessary for Compute Canada systems
unset XDG_RUNTIME_DIR

#

echo -e "
    Copy/Paste this in your local terminal to ssh tunnel with remote
    -----------------------------------------------------------------
    sshuttle --dns -Nr ${USER}@cedar.computecanada.ca
    -----------------------------------------------------------------
    (Note: you may need to install locally via 'pip install sshuttle'.)

    Then open a browser on your local machine to the URL below.

    OR withoout sshuttle (Windows 10 WLS) open port forwarding as described
    in the notebook and point your browser to the address below
    - except change the compute node hostname to localhost
"

echo SLURM_SUBMIT_DIR is $SLURM_SUBMIT_DIR

ipnip=$(hostname -f)
jupyter-notebook --no-browser --ip=$ipnip --notebook-dir=$SLURM_SUBMIT_DIR

