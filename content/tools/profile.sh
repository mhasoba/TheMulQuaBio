#!/bin/bash
# Adds profiling code to RScripts, 
# will conditionally call Python profiling with same dynamic naming

#####################NOTES ON USE ####################
# run this after running the miniproject in question #
# it will add command to the start and end of any R  #
# script it finds. These will take effect when that  #
# script is run again. Any Python is profiled in     #
# as this script is run, hence why it should be run  #
# after the project has already successfully run once#
######################################################


INPUTDIR=$1

if [ ! -d "$INPUTDIR" ] 
then
    echo "Error: Bad input, $INPUTDIR does not exist or is not full file path."
    #echo "Directory /path/to/dir exists." 
#else
    #echo "Error: Bad input, $INPUTDIR does not exist or is not full file path."
fi
FILES=$INPUTDIR/*
for FILE in $FILES; do
    #echo $(basename -- $FILE)
    if [[ $FILE == *.R ]]
    then
        f="$(basename -- $FILE)"
        o=${f%.R}
        #echo $o
        OUTNAME="$o.out"
        #echo $OUTNAME
        LOG="$f.log"
        #echo $f
        sed -i "1 i\Rprof('$OUTNAME')" $FILE
        sed -i -e "$ a capture.output(summaryRprof('$OUTNAME'), file = '$LOG')" $FILE
    elif [[ $FILE == *.py ]]
    then 
        echo "Python file found, profiling..."
        cd $INPUTDIR
        f="$(basename -- $FILE)"
        o=${f%.py}
        LOG="$o.log"
        python3 -m cProfile -s 'cumulative' $FILE > $LOG
    
    fi
done