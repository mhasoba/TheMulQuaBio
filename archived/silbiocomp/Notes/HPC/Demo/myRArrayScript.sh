#!/bin/bash

#PBS -l walltime=1:00:05

module load R/2.8.1
module load intel-suite

echo "R is about to run"

R CMD BATCH $HOME/Demo/myJobArrayR.r $HOME/Demo/Rconsole_${PBS_ARRAY_INDEX}.txt

echo "R has finished running"

