#!/bin/bash
# Setup environment for coding

# 1) CUDA
export CUDAROOT="/usr/local/cuda"
export PATH="$CUDAROOT/bin:$PATH"
export LD_LIBRARY_PATH="$CUDAROOT/lib64:$LD_LIBRARY_PATH"
export CUDNNROOT="$CUDAROOT"
export PATH="$CUDNNROOT/bin:$PATH"
export LD_LIBRARY_PATH="$CUDNNROOT/lib64:$LD_LIBRARY_PATH"

# 2) Local installs
export LOCALDIR="$HOME/.local"
export PATH="$LOCALDIR/bin:$PATH"

# 3) Miniconda
export MCONDA="$LOCALDIR/conda/miniconda3"
export PY3K="$MCONDA/envs/py3k"
export PATH="$PY3K/bin:$MCONDA/bin:$PATH"
export PYTHONPATH="$PY3K/lib/python3.6/site-packages:$PYTHONPATH"
export PATH="$PY3K/bin:$PATH"
export CPATH="$PY3K/include:$CPATH"
export LD_LIBRARY_PATH="$PY3K/lib:$LD_LIBRARY_PATH"


source activate py3k
