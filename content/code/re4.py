import re

"""" 
Playing around with extracting email addresses or their subsets.

From Wikipedia: 
The format of email addresses is local-part@domain 
the local-part may be up to 64 characters 
the domain name may have a maximum of 253 characters

The local-part of the email address may use any of these 
ASCII characters:
- Uppercase and lowercase English letters
- Digits 0 to 9
- Characters !#$%&'*+-/=?^_`{|}~
- Character . provided that it is not the first or last 
  character, and provided also that it does not appear 
  two or more times consecutively

The domain name is formed by letters, digits,
hypens and dots.
"""

valid1 = "niceandsimple@example.com"
valid2 = "very.common@example.com"
validbutterrible = "!#$%&'*+-/=?^_`{}|~@example.org"

invalid1 = "Abc.example.com"
invalid2 = "Abc.@example.com"

#matching the simplest one:
emailpattern1 = r'^[a-zA-Z0-9\._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$'
print re.search(emailpattern1, valid1).group()

#matching a nasty one:
emailpattern = r'[a-z0-9!#$%&\'*+/=?^_`{|}~-]+(?:\.[a-z0-9!\#$%&\'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?'
print re.search(emailpattern, validbutterrible).group()