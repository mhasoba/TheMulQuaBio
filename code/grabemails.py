import re
"""
Goal:
Scrape emails from the file 
../Data/email_addresses_e_and_e.txt
containing the email addresses of
all the E&E faculty.

Note the following:
Multiple dots in the domain name:
justin.borevitz(at)anu(dot)edu(dot)au
reinitz(at)galton(dot)uchicago(dot)edu

Hyphen in the local part:
j-coyne(at)uchicago(dot)edu 
"""

# read the file with email addresses
f = open('../Data/email_addresses_e_and_e.txt')
my_file_email = f.read()
f.close()

# substitute (at) with @
my_text = my_file_email.replace('(at)', '@')

# substitute (dot) with .
my_text = my_text.replace('(dot)', '.')

# now build a regular expression to grab the emails
my_reg = r'email:\s?([A-Za-z\.\-_0-9]*@[A-Za-z\.\-_0-9]*\.\w{2,3})'
emails = re.findall(my_reg, my_text)

# A little more difficult: save the last names
# Note that each is followed by Ph.D.

my_reg2 = r'([A-Za-z-\']+),\sPh\.D\.'
lastnames = re.findall(my_reg2, my_text)

# now print them together
for i in range(len(emails)):
    print lastnames[i], emails[i]

# Exercise: now add the phone number!
