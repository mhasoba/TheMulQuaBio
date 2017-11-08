#!/bin/bash
#PBS -N myname
#PBS -q batch 
#PBS -d .
#PBS -j oe
#PBS -S /bin/bash
python myprogram.py 123 mickey 456 mouse


