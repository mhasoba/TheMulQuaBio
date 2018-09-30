import csv
import re
import scipy

f = open('../Data/Nature-2011.csv', 'r')
csvread = csv.reader(f)
# skip the first line
csvread.next()

longaut = ''
lengthau = 0

numauthors = []
match = re.compile(r'[A-Za-z\-]+,|[A-Za-z\-]+\sJr\.,')

for row in csvread:
    au = row[0]
    # convert to ascii
    au = au.decode('ascii', 'ignore')
    numauthors.append(len(re.findall(match, au)))
    # 
    if len(re.findall(match, au)) == 373:
        print row
        print re.findall(match, au)
f.close()

print 'min', min(numauthors)
print 'max', max(numauthors)
print 'mean', scipy.mean(numauthors)
print 'median', scipy.median(numauthors)


