#!/bin/bash

#lines declaring parameters to request from HPC:

## tell the batch manager to limit the walltime for the job to given hh:mm:ss
#PBS -l walltime=06:30:00 

## tell the batch manager to use 1 node with 1 cpu (total 1*1 cpus) and 4000mb of memory per node
#PBS -l select=1:ncpus=1:mem=4000mb
## *NOTE: serial jobs do not require a number of cpus*

## Name your job (optional, but can be convenient)
#PBS -N Py_test_1

## setup to get an email when scripts starts and ends (or aborts) 
#PBS -m abe 
## Look up man qsub for what the options a,b,e do

## Specify email address (multiple addresses can be set; look up man qsub)
#PBS -M your.email@imperial.ac.uk

# Load python as engine; default is 2.7.3 change version from 2.7.3 if 
## needed (python 3 is supported)
module load python/2.7.3

# general tools
module load intel-suite
## Intel math kernel must be loaded at run time for compiling etc. 

echo "Python is about to run"

python < $WORK/TestPyHPC/MyHPCScript.py
## tells the batch manager to execute MyHPCScript.py in 
## TestPyHPC using python

# mv the output file result*
echo "Moving output files"
mv result* $WORK/TestPyHPC/output/

echo "Python has finished running"
