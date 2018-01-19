#install the sqlite package
install.packages('sqldf')

# To load the packages
library(sqldf)

# The command below opens a connection to the database.
#If the database does not yet exist, one is created in the working directory of R.
db <- dbConnect(SQLite(), dbname='Test.sqlite')

# Now let's enter some data to the table
# Using the db connection to our database, the data are entered using SQL queries
# The next command just create the table
dbSendQuery(conn = db,
            "CREATE TABLE Consumer
       (OriginalID TEXT,
        ConKingdom TEXT,
        ConPhylum TEXT,
        ConSpecies TEXT)")

# Once the table is created, we can enter the data.
#INSERT specifies where the data is entered (here the School table).
#VALUES contains the data

 dbSendQuery(conn = db,
         "INSERT INTO Consumer
         VALUES (1, 'Animalia', 'Arthropoda', 'Chaoborus trivittatus')")
 dbSendQuery(conn = db,
         "INSERT INTO Consumer
         VALUES (2, 'Animalia', 'Arthropoda', 'Chaoborus americanus')")
 dbSendQuery(conn = db,
         "INSERT INTO Consumer
         VALUES (3, 'Animalia', 'Chordata', 'Stizostedion vitreum')")


# Once we have our table, we can query the results using:

dbGetQuery(db, "SELECT * FROM Consumer")
dbGetQuery(db, "SELECT * FROM Consumer WHERE ConPhylum='Chordata'")


# Tables can be also imported from csv files.
# As example, let's use the Biotraits dataset.
# The easiest way is to read the csv files into R as data frames.
# Then the data frames are imported into the database.

Resource <- read.csv("../Data/Resource.csv")  # Read csv files into R

# Import data frames into database
 dbWriteTable(conn = db, name = "Resource", value = Resource, row.names = FALSE)

# Check that the data have been correctly imported into the School table.
 dbListTables(db)                 # The tables in the database
 dbListFields(db,"Resource")       # The columns in a table
 dbReadTable(db, "Resource")    # The data in a table

# Before leaving RSQLite, there is a bit of tidying-up to do.
# The connection to the database is closed, and as precaution
# the three data frames are removed from R’s environment.
 dbDisconnect(db)            # Close connection
 rm(list = c("Resource"))   # Remove data frames


