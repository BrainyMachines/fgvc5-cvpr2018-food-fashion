#!/bin/bash

apt-get update 
apt-get install -y build-essential binutils git imagemagick unzip parallel gcc g++


echo "Checking for CUDA and installing."
# Check for CUDA and try to install.
if ! dpkg-query -W cuda-9-1; then
  curl -O http://developer.download.nvidia.com/compute/cuda/repos/ubuntu1604/x86_64/cuda-repo-ubuntu1604_9.1.85-1_amd64.deb
  dpkg -i ./cuda-repo-ubuntu1604_9.1.85-1_amd64.deb
  apt-key adv --fetch-keys http://developer.download.nvidia.com/compute/cuda/repos/ubuntu1604/x86_64/7fa2af80.pub
  apt-get update
  apt-get install cuda-9-1 -y
fi
# Enable persistence mode
nvidia-smi -pm 1

# CUDNN
export CUDNN_VERSION="7.1.4.18"
apt-get update
apt-get install -y --no-install-recommends \
            libcudnn7=$CUDNN_VERSION-1+cuda9.1 \
            libcudnn7-dev=$CUDNN_VERSION-1+cuda9.1


curl -O http://developer.download.nvidia.com/compute/machine-learning/repos/ubuntu1604/x86_64/nvidia-machine-learning-repo-ubuntu1604_1.0.0-1_amd64.deb
apt-get install -y libnccl2=2.1.15-1+cuda9.1 libnccl-dev=2.1.15-1+cuda9.1

nvidia-smi

apt-get update
apt-get install -y --no-install-recommends \
         build-essential \
         cmake \
         git \
         curl \
         vim \
         ca-certificates \
         libjpeg-dev \
         libpng-dev

mkdir -p /mnt/ram-disk
mount -t tmpfs -o size=50g tmpfs /mnt/ram-disk
mkdir -p /mnt/ram-disk/imaterialist_fashion
chown -R saurabh_daptardar:saurabh_daptardar /mnt/ram-disk/imaterialist_fashion

# mkdir -p /mnt/disks
# mkdir -p /mnt/disks/imaterialist_fashion
# mount -t ext4 /dev/sdb /mnt/disks/imaterialist_fashion
