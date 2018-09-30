import re

## Goal: find the average temperature 
## in January for all the cities in
## Data/AvgTemperature

# The records look like:
# 1             1             1995         58.3\r\n <- used for new line

# First: build a regular expression that 
# extracts the day, year and average temperature

myreg = re.compile(r'') # <- write the regular expression!

# Now let's test it on the Rome temperatures
filename = "../Data/AvgTemperature/IYROME.txt"
f = open(filename, 'r')
mytext = f.read()
f.close()

print re.findall(myreg, mytext)
# This should give you a list containing 
# tuples:
# ('1', '1995', '58.3'), 
# ('2', '1995', '46.5'), 
# ('3', '1995', '41.6'),
# ....
# Now elaborate the list to get the average
# for each year 

# finally, repeat for each city
