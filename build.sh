#!/bin/bash

mkdir scater-objects

for f in `ls process-data`; do
    name=(${f//./ })
    mkdir $name
    cd $name
    # download and process a dataset; create scater object
    sh ../process-data/$name.sh
    Rscript ../create-scater/$name.R
    cp *.rds ../scater-objects
    cd ..
    rm -rf $name
done