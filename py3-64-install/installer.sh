#!/bin/bash

CHANNELS=""
CHANNELS="${CHANNELS}  -c conda-forge"
CHANNELS="${CHANNELS}  -c aps-anl-tag"
CHANNELS="${CHANNELS}  -c apsu"
CHANNELS="${CHANNELS}  -c prjemian"
CHANNELS="${CHANNELS}  -c nexpy"

INSTALLER=Anaconda3-2019.07-Linux-x86_64.sh
TARGET_DIR=/APSshare/anaconda3/x86_64

conda deactivate
wget https://repo.continuum.io/archive/${INSTALLER}
bash ./${INSTALLER} -b -p ${TARGET_DIR}
source ${TARGET_DIR}/bin/activate
conda install --yes ${CHANNELS} --file requirements-conda.txt
pip install -r requirements-pip.txt
conda env export | tee export-new.yml
