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

dwld() {
[ `identify $2.jpg |& awk '{ print $2 == "JPEG" }'` -eq 1 ] ||  (wget -q $1 -O $2.jpg &&  mogrify -resize "256^>" $2.jpg)
}

export -f dwld

cd $dst
pwd
parallel --no-notice --progress --bar --colsep=' ' -j $njobs 'dwld {1} {2}' :::: "$filelist"
cd -
