#!/bin/bash

# Create RAM disk
mkdir -p /mnt/ram-disk
mount -t tmpfs -o size=50g tmpfs /mnt/ram-disk
mkdir -p /mnt/ram-disk/imaterialist_fashion
chown -R saurabh_daptardar:saurabh_daptardar /mnt/ram-disk/imaterialist_fashion

# Mount Persistent disk and rsync 
mkdir -p /mnt/disks
mkdir -p /mnt/disks/imaterialist_fashion
mount -t ext4 /dev/sdb /mnt/disks/imaterialist_fashion && \
rsync -avz /mnt/disks/imaterialist_fashion/ /mnt/ram-disk/imaterialist_fashion/
