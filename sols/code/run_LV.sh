#!/bin/bash

#script that runs the LV1, LV2 and LV3 python scripts and runs profiling on them

# run with profiling in ipython
echo "%run -p LV1.py" | ipython
echo "%run -p LV2.py 1 0.1 1.5 0.75 35" | ipython
echo "%run -p LV3.py 1 0.1 1.5 0.75 60" | ipython
echo "%run -p LV4.py 1 0.1 1.5 0.75 60" | ipython
