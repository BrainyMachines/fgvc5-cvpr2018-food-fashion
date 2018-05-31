#!/bin/bash

source env.sh

conda install -y jupyter nb_conda

jupyter notebook --generate-config
jupyter notebook password

conda install -y tqdm ipdb matplotlib
conda install -y pytorch torchvision cuda91 -c pytorch



