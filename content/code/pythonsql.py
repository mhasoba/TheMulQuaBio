# import the sqlite3 library
import sqlite3

# create a connection to the database
conn = sqlite3.connect('../Data/test.db')

# to execute commands, create a "cursor"
c = conn.cursor()

# use the cursor to execute the queries
# use the triple single quote to write 
# queries on several lines
c.execute('''CREATE TABLE Test
           (ID INTEGER PRIMARY KEY, 
           MyVal1 INTEGER,
           MyVal2 TEXT)''')

#~c.execute('''DROP TABLE test''')
           
# insert the records. note that because
# we set the primary key, it will auto-increment
# therefore, set it to NULL
c.execute('''INSERT INTO Test VALUES 
           (NULL, 3, 'mickey')''')

c.execute('''INSERT INTO Test VALUES 
           (NULL, 4, 'mouse')''')

# when you "commit", all the commands will 
# be executed
conn.commit()

# now we select the records
c.execute("SELECT * FROM TEST")

# access the next record:
print c.fetchone()
print c.fetchone()

# let's get all the records at once
c.execute("SELECT * FROM TEST")
print c.fetchall()

# insert many records at once: 
# create a list of tuples
manyrecs = [(5, 'goofy'), 
            (6, 'donald'),
            (7, 'duck')]

# now call executemany
c.executemany('''INSERT INTO test 
                 VALUES(NULL, ?, ?)''', manyrecs)

# and commit
conn.commit()

# now let's fetch the records
# we can use the query as an iterator!
for row in c.execute('SELECT * FROM test'):
    print 'Val', row[1], 'Name', row[2]

# close the connection before exiting
conn.close()
