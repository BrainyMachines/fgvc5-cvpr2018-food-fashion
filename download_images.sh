#!/bin/bash

if [ $# -ne 3 ]
then
    cat << MSG
    Usage: ./download.sh /path/to/filelist.txt /pat/to/dest/folder num_jobs
    exit
MSG
fi

filelist="$1"
dst="$2"
njobs="$3"

cd $dst
pwd
parallel --no-notice --progress --bar --timeout="300%" --colsep=' ' -j $njobs 'wget -q --no-clobber {1} -O {2}.jpg &&  mogrify -resize "256^>" {2}.jpg' :::: "$filelist"
cd -
