#!/bin/bash
# Shows the use of variables
MyVar='some string'
echo 'the current value of the variable is:' 
echo $MyVar
echo 'Please enter a new string'
read MyVar
if [ -z "$MyVar" ]; then
    echo "\$MyVar is empty; Need a string as input!"
    echo "exiting..."
    exit 1  
else
    echo 'the current value of the variable is' 
    echo $MyVar
fi

## Reading multiple values
echo 'Enter two numbers separated by space(s)'
read a b
if [[ -z "$a" || -z "$b" ]]; then
    echo "Incorrect inputs; Need two numbers!"
    echo "exiting..."
    exit 1  
else
		echo 'you entered' $a 'and' $b '. Their sum is:' 
		mysum=`expr $a + $b`
		echo $mysum
fi

exit 0
