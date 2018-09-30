#!/bin/bash

#PBS -l walltime=1:00:05

module load R/2.8.1
module load intel-suite

echo "R is about to run"

R CMD BATCH $HOME/Demo/myR.r $HOME/Demo/Rconsole.txt

echo "R has finished running"

