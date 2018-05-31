#!/bin/bash

export CROOT="$HOME/.local/conda"
export MROOT="$CROOT/miniconda3"

mkdir -p "$HOME/.local"
# mkdir -p "$CROOT"

curl -o ~/miniconda.sh -O  https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh  && \
chmod +x ~/miniconda.sh && \
~/miniconda.sh -b -p $CROOT && \
rm ~/miniconda.sh && \
$CROOT/bin/conda create -n py3k python=3 && \
$CROOT/bin/conda list -n py3k && \
$CROOT/bin/conda install -n py3k numpy pyyaml scipy ipython mkl mkl-include && \
$CROOT/bin/conda install -n py3k -c pytorch magma-cuda91 && \
$CROOT/bin/conda install -n py3k -c jupyter ipykernel
