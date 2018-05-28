#!/bin/bash

export CROOT="$HOME/.local/conda"
export MROOT="$CROOT/miniconda3"

mkdir -p "$HOME/.local"
mkdir -p "$CROOT"

curl -o ~/miniconda.sh -O  https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh  && \
chmod +x ~/miniconda.sh && \
~/miniconda.sh -b -p $CROOT && \
rm ~/miniconda.sh && \
$MROOT/bin/conda create -n py3k python=3 && \
$MROOT/bin/conda list -n py3k && \
$MROOT/bin/conda install -n py3k numpy pyyaml scipy ipython mkl mkl-include && \
$MROOT/bin/conda install -n py3k -c pytorch magma-cuda91 && \
$MROOT/bin/conda install -n py3k -c jupyter ipykernel
