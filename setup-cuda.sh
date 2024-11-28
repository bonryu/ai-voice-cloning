#!/bin/bash
# get local dependencies
git submodule init
git submodule update --remote
# setup venv
python3 -m venv venv
source ./venv/bin/activate
python3 -m pip install --upgrade pip # just to be safe
# CUDA
pip3 install torch torchvision torchaudio --index-url https://download.pytorch.org/whl/cu118
# install requirements
python3 -m pip install -r ./modules/tortoise-tts/requirements.txt # install TorToiSe requirements
python3 -m pip install -e ./modules/tortoise-tts/                 # install TorToiSe
python3 -m pip install -r ./modules/dlas/requirements.txt         # instal DLAS requirements, last, because whisperx will break a dependency here
python3 -m pip install -e ./modules/dlas/                         # install DLAS
python3 -m pip install -r ./requirements.txt                      # install local requirements

# rm *.bat

# download rvc_lightweight.zip but install rvc requirements only.
# pip install  -r/modules/rvc/requirements.txt
# above  works but needed to change the following:
# numba>=0.56.4   # == 0.56.4
# llvmlite>=0.39.0 # ==0.39.0
# download fairseq whl
# download deepspeed whl
# download pyfastmp3decoder whl
#
# Install fairseq whl
# - fairseq v0.10.2 installs whl
# - Had to following the instructions from https://github.com/facebookresearch/fairseq to clone the repo and "pip install -e ./"
# Install rvc-tts-pipeline from git egg (aka by project name)
# - python3 -m pip install git+https://github.com/JarodMica/rvc-tts-pipeline.git@lightweight#egg=rvc_tts_pipe
# Install deepspeed whl
# Install pyfastmp3decoder whl
# Install whisperx from git
#
# easy-install.pth
# __editable___dlas_0_0_1_finder.py
# __editable__.dlas-0.0.1.pth
# __editable___fairseq_0_10_2_finder.py
# __editable__.fairseq-0.10.2.pth
# __editable___TorToiSe_2_4_5_finder.py
# __editable__.TorToiSe-2.4.5.pth
deactivate
