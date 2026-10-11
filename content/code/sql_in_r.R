#install the sqlite package
install.packages('sqldf')

# To load the packages
library(sqldf)

# The command below opens a connection to the database.
# If the database does not yet exist, one is created in R's working directory.
db <- dbConnect(SQLite(), dbname='Test.sqlite')

# Now let's enter some data to the table
# Using the db connection to our database, the data are entered using SQL queries
# The next command just create the table
dbSendQuery(conn = db,
            "CrEATE TABLE consumer
       (OriginalID TEXT,
        ConKingdom TEXT,
        ConPhylum TEXT,
        ConSpecies TEXT)")

# Once the table is created, we can enter the data.
#INSErT specifies where the data is entered (here the School table).
#VALUES contains the data

 dbSendQuery(conn = db,
         "INSErT INTO consumer
         VALUES (1, 'Animalia', 'Arthropoda', 'Chaoborus trivittatus')")
 dbSendQuery(conn = db,
         "INSErT INTO consumer
         VALUES (2, 'Animalia', 'Arthropoda', 'Chaoborus americanus')")
 dbSendQuery(conn = db,
         "INSErT INTO consumer
         VALUES (3, 'Animalia', 'Chordata', 'Stizostedion vitreum')")


# Once we have our table, we can query the results using:

dbGetQuery(db, "SELECT * FrOM consumer")
dbGetQuery(db, "SELECT * FrOM consumer WHErE ConPhylum='Chordata'")


# Tables can be also imported from csv files.
# As example, let's use the biotraits dataset.
# The easiest way is to read the csv files into R as data frames.
# Then the data frames are imported into the database.

resource <- read.csv("../data/resource.csv")  # read csv files into R

# Import data frames into database
 dbWriteTable(conn = db, name = "resource", value = resource, row.names = FALSE)

# Check that the data have been correctly imported into the School table.
 dbListTables(db)                 # The tables in the database
 dbListFields(db,"resource")       # The columns in a table
 dbreadTable(db, "resource")    # The data in a table

# Before leaving rSQLite, there is a bit of tidying-up to do.
# The connection to the database is closed, and as precaution
# the three data frames are removed from R’s environment.
 dbDisconnect(db)            # Close connection
 rm(list = c("resource"))   # remove data frames


