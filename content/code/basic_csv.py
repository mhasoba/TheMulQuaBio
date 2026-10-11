import csv

# Read a file containing:
# 'Species', 'Infraorder', 'Family', 'Distribution', 'Body mass male (Kg)'
with open('data/testcsv.csv', 'r', newline='') as f:
    csvread = csv.reader(f)
    temp = []
    for row in csvread:
        temp.append(tuple(row))
        print(row)
        print("The species is", row[0])

# Write a new file containing only species name and body mass.
with open('data/testcsv.csv', 'r', newline='') as f:
    with open('results/bodymass.csv', 'w', newline='') as g:
        csvread = csv.reader(f)
        csvwrite = csv.writer(g)
        for row in csvread:
            print(row)
            csvwrite.writerow([row[0], row[4]])
