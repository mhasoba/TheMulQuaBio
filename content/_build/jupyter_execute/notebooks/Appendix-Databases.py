#!/usr/bin/env python
# coding: utf-8

# # Databases <span class="tocSkip"></span> 

# Introduction
# ------------
# 
# Many of you will deal with complex data — and often, lots of it. Ecological and Evolutionary data are particularly complex because they contain large numbers of attributes, often measured in very different scales and units for individual taxa, populations, etc. In this scenario, storing the data in a database makes a lot of sense! You can
# easily include the database in your analysis workflow — indeed, that's why people use databases. And you can use python (and R) to build, manipulate and use your database.
# 
# ### Relational databases
# 
# 
# A *relational* database is a collection of interlinked (*related*) tables that altogether store a complex dataset
# in a logical, computer-readable format. Dividing a dataset into multiple tables minimizes redundancies. For example, if your data were sampled from three sites — then, rather than repeating the site name and description in each row in a text file, you could just specify a numerical "key" that directs to another table containing the sampling site name and description.
# 
# Finally, if you have many rows in your data file, the type of sequential access we have been using in our `python` and `R` scripts is inefficient — you should be able to instantly access any row regardless of its position
# 
# Data columns in a database are usually called *fields*, while the rows are the *records*. Here are a few things to
# keep in mind about databases:
# 
# * Each field typically contains only one data type (e.g., integers, floats, strings)
# * Each record is a "data point", composed of different values, one for each field — somewhat like a python tuple
# * Some fields are special, and are called *keys*:
#     * The *primary key* uniquely defines a record in a table (e.g., each row is identified by a unique number)
#     * To allow fast retrieval, some fields (and typically all the keys) are indexed — a copy of certain columns that can be searched very efficiently.
#     * *Foreign keys* are keys in a table that are primary keys in another table and define relationships between the tables
# 
# The key to designing a database is to minimize redundancy and dependency without losing the logical consistency of tables — this is called *normalization* (arguably more of an art than a science!)
# 
# Let's look at a simple example.
# 
# Imagine you recorded body sizes of species from different field sites in a single text file (e.g., a `.csv` file) with the following fields:
# 
# |Field|Definition|
# |:-|:-|
# |`ID` |             Unique ID for the record|
# |`SiteName` |       Name of the site|
# |`SiteLong` |       Longitude of the site|
# |`SiteLat` |        Latitude of the site|
# |`SamplingDate` |   Date of the sample|
# |`SamplingHour` |   Hour of the sampling|
# |`SamplingAvgTemp` | Average air temperature on the sampling day|
# |`SamplingWaterTemp` |   Temperature of the water|
# |`SamplingPH` |     PH of the water|
# |`SpeciesCommonName`|   Species of the sampled individual|
# |`SpeciesLatinBinom`|   Latin binomial of the species|
# |`BodySize` |       Width of the individual|
# |`BodyWeight` |     Weight of the individual|
# 
# 
# It would be logical to divide the data into four tables:
# 
# *Site table*:
# 
# |Field|Definition|
# |:-|:-|
# |`SiteID` |ID for the site|
# |`SiteName`|   Name of the site|
# |`SiteLong` |  Longitude of the site|
# |`SiteLat`   | Latitude of the site|
# 
# 
# *Sample table*:
# 
# |Field|Definition|
# |:-|:-|
# |`SamplingID` |     ID for the sampling date|
# |`SamplingDate` |   Date of the sample|
# |`SamplingHour` |   Hour of the sample|
# |`SamplingAvgTemp` |Average air temperature|
# |`SamplingWaterTemp`|   Temperature of the water|
# |`SamplingPH` |     PH of the water|
# 
# 
# *Species table*:
# 
# |Field|Definition|
# |:-|:-|
# |`SpeciesID` |      ID for the species|
# |`SpeciesCommonName`|   Species name|
# |`SpeciesLatinBinom` |  Latin binomial of the species|
# 
# 
# *Individual table*:
# 
# |Field|Definition|
# |:-|:-|
# |`IndividualID`|   ID for the individual sampled|
# |`SpeciesID` | ID for the species|
# |`SamplingID` |ID for the sampling day|
# |`SiteID` |    ID for the site|
# |`BodySize` |  Width of the individual|
# |`BodyWeight` | Weight of the individual|
# 
# In each table, the first ID field is the primary key. The last table contains three foreign keys because each individual is associated with one species, one sampling day and one sampling site.
# 
# These structural features of a database are called its *schema*.
# 
# ## SQLite
# 
# `SQLite` is a simple (and very popular) SQL (Structured Query Language)-based solution for managing localized, personal databases. I can safely bet that most, if not all of you unknowingly (or knowingly!) use `SQLite` — it is used by MacOSX, Firefox, Acrobat Reader,iTunes, Skype, iPhone, etc. SQLite is also the database "engine" underlying your [Silwood Masters Web App](http://silwoodmasters.co.uk)
# 
# We can easily use SQLite through Python scripts. First, install SQLite by typing in the Ubuntu terminal:
# 
# ```bash
# sudo apt install sqlite3 libsqlite3-dev
# ```

# Also, make sure that you have the necessary package for python by typing `import sqlite3` in the python or ipython shell. Finally, you may install a GUI for SQLite3 :
# 
# `sudo apt install sqliteman`

# Now type `sqlite3` in the Ubuntu terminal to check if SQLite successfully launches.
# 
# SQLite has very few data types (and lacks a boolean and a date type):
# 
# |Field Data Type| Definition|
# |:-|:-|
# |`NULL` | The value is a NULL value |
# |`INTEGER` |   The value is a signed integer, stored in up to or 8 bytes |
# |  `REAL` | The value is a floating point value, stored as in 8 bytes |
# |  `TEXT` | The value is a text string |
# |  `BLOB` | The value is a blob of data, stored exactly as it was input (useful for binary types, such as bitmap images or pdfs) |
# 
# Typically, you will build a database by importing csv data — be aware that:
# 
# * Headers: the csv should have no headers
# * Separators: if the comma is the separator, each record should not contain any other commas
# * Quotes: there should be no quotes in the data
# * Newlines: there should be no newlines
# 
# Now build your first database in SQLite! We will use as example a global dataset on metabolic traits called *Biotraits* that we are currently developing in our lab (should be in your `Data` directory). This dataset contains 164 columns (fields). Thermal response curves for different traits and species are stored in rows. This means
# that site description or taxonomy are repeated as many times as temperatures are measured in the curve. You can imagine how much redundacy can be here!!!
# 
# For this reason, it is easier to migrate the dataset to SQL and split it into several tables:
# 
# * *TCP*: Includes the thermal curve performance for each species and trait (as many rows per trait and species as temperatures have been measured within the TCP)
# 
# * *TraitInfo*: Contains site description and conditions under the traits were measured (one row per thermal curve)
# 
# * Consumer: Consumer description including taxonomy (one row per thermal
# curve).
# 
# * Resource: Resource description including taxonomy (one row per thermal
# curve).
# 
# * Size: Size data for each species (one row per thermal curve)
# 
# DataSource: Contains information about the data source (citation, contributors) (one row per thermal curve).
# 
# So all these tables compose the *Biotraits* `schema`.
# 
# In an Linux/Unix terminal, navigate to your `data` directory:

# Now, launch a new database using sqlite:

# ```bash
# sqlite3 Biotraits.db
# ```
# 
# This should return something like:
# 
# ```sql
# SQLite version 3.11.0 2016-02-15 17:29:24
# Enter ".help" for usage hints.
# ```

# This creates an empty database in your `data` directory. 
# 
# You should now see the sqlite cursor (`sqlite>`), and will be entering your commands there. 
# 
# Now we need to create a table with some fields. Let's start with the *TraitInfo* table (enter these one line at  a time, without the `...>`):

# ```bash
# sqlite> CREATE TABLE TraitInfo (Numbers integer primary key,
#    ...>                                 OriginalID text,
#    ...>                                 FinalID text,
#    ...>                                 OriginalTraitName text,
#    ...>                                 OriginalTraitDef text,
#    ...>                                 Replicates integer,
#    ...>                                 Habitat  integer,               
#    ...>                                 Climate text,
#    ...>                                 Location text,
#    ...>                                 LocationType text,
#    ...>                                 LocationDate text,
#    ...>                                 CoordinateType text,
#    ...>                                 Latitude integer,
#    ...>                                 Longitude integer);
# ```   

# Note that I am writing all SQL commands in upper case, but it is not necessary. I am using upper case here because SQL syntax is long and clunky, and it quickly becomes hard to spot (and edit) commands in long strings of complex queries.
# 
# Now let's import the dataset:

# `sqlite> .mode csv`
# 
# `sqlite> .import TraitInfo.csv TraitInfo`

# So we built a table and imported a csv file into it. Now we can ask
# SQLite to show all the tables we currently have:

# `sqlite> .tables`

# Let's run our first *Query* (note that you need a semicolon
# to end a command):

# `sqlite> SELECT * FROM TraitInfo LIMIT 5;`

# Let's turn on some nicer formatting:

# `sqlite> .mode column`
# 
# `sqlite> .header ON`
# 
# `sqlite> SELECT * FROM TraitInfo LIMIT 5;`
# 
# You should see something like: 
# 
# ```bash
# Numbers  OriginalID  FinalID     OriginalTraitName           ... 
# -------  ----------  ----------  -------------------------   ...
# 1        1           MTD1        Resource Consumption Rate   ...
# 4        2           MTD2        Resource Consumption Rate   ...
# 6        3           MTD3        Resource Consumption Rate   ...
# 9        4           MTD4        Resource Mass Consumption   ...
# 12       5           MTD5        Resource Mass Consumption   ...
# ```

# The main statement to select records from a table is
# `SELECT`:

# `sqlite> .width 40  ## NOTE: Control the width`
# 
# `sqlite> SELECT DISTINCT OriginalTraitName FROM TraitInfo; # Returns unique values`
# 
# Which gives:
# 
# ```bash
# OriginalTraitName                       
# ----------------------------------------
# Resource Consumption Rate               
# Resource Mass Consumption Rate          
# Mass-Specific Mass Consumption Rate     
# Voluntary Body Velocity                 
# Forward Attack Distance                 
# Foraging Velocity                       
# Resource Reaction Distance                   
# ....
# ```
# 
# Now try these: 
# 
# ```bash
# sqlite> SELECT DISTINCT Habitat FROM TraitInfo
#    ...> WHERE OriginalTraitName = "Resource Consumption Rate"; # Sets a condition`
# 
# Habitat                                 
# ----------------------------------------
# freshwater                              
# marine                                  
# terrestrial 
# 
# sqlite> SELECT COUNT (*) FROM TraitInfo;  # Returns number of rows
# 
# Count (*)           
# --------------------
# 2336
# 
# sqlite> SELECT Habitat, COUNT(OriginalTraitName) # Returns number of rows for each group
#    ...> FROM TraitInfo GROUP BY Habitat;
# 
# Habitat     COUNT(OriginalTraitName)
# ----------  ------------------------
# NA          16                      
# freshwater  609                     
# marine      909                     
# terrestria  802   
# 
# sqlite> SELECT COUNT(DISTINCT OriginalTraitName) # Returns number of unique values
#    ...> FROM TraitInfo;
# 
# COUNT(DISTINCT OriginalTraitName)
# ---------------------------------
# 220   
# 
# sqlite> SELECT COUNT(DISTINCT OriginalTraitName) TraitCount # Assigns alias to the variable
#    ...> FROM TraitInfo;
# 
# TraitCount
# ----------
# 
# sqlite> SELECT Habitat,
#    ...> COUNT(DISTINCT OriginalTraitName) AS TN
#    ...> FROM TraitInfo GROUP BY Habitat;
# 
# Habitat     TN        
# ----------  ----------
# NA          7         
# freshwater  82        
# marine      95        
# terrestria  96     
# 
# sqlite> SELECT * # WHAT TO SELECT
#    ...> FROM TraitInfo # FROM WHERE
#    ...> WHERE Habitat = "marine" # CONDITIONS
#    ...> AND OriginalTraitName = "Resource Consumption Rate";
# 
# Numbers     OriginalID  FinalID     OriginalTraitName          ...
# ----------  ----------  ----------  -------------------------  ...
# 778         308         MTD99       Resource Consumption Rate  ...
# 798         310         MTD101      Resource Consumption Rate  ...
# 806         311         MTD102      Resource Consumption Rate  ...
# 993         351         MTD113      Resource Consumption Rate  ...
# ```

# The structure of the `SELECT` command is as follows (*Note: **all** characters are case **in**sensitive*):

# ```bash
# SELECT [DISTINCT] field
# FROM table
# WHERE predicate
# GROUP BY field
# HAVING predicate
# ORDER BY field
# LIMIT number
# ;
# ```

# Let's try some more elaborate queries:

# ```bash
# sqlite> SELECT Numbers FROM TraitInfo LIMIT 5;
# 
# Numbers   
# ----------
# 1         
# 4         
# 6         
# 9         
# 12      
# 
# sqlite> SELECT Numbers 
#    ...> FROM TraitInfo
#    ...> WHERE Numbers > 100 
#    ...> AND Numbers < 200;
# 
# Numbers   
# ----------
# 107       
# 110       
# 112       
# 115         
# 
# sqlite> SELECT Numbers 
#    ...> FROM TraitInfo
#    ...> WHERE Habitat = "freshwater"
#    ...> AND Number > 700
#    ...> AND Number < 800;
# 
# Numbers   
# ----------
# 704       
# 708       
# 712       
# 716       
# 720       
# 725       
# 730       
# 735       
# 740       
# 744       
# 748       
# ```     

# You can also match records using something like regular expressions. In SQL, when we use the command `LIKE`, the percent % symbol matches any sequence of zero or more characters and the underscore matches any single character. Similarly, `GLOB` uses the asterisk and the underscore.

# ```bash
# sqlite> SELECT DISTINCT OriginalTraitName
#    ...> FROM TraitInfo
#    ...> WHERE OriginalTraitName LIKE "_esource Consumption Rate";
# 
# OriginalTraitName        
# -------------------------
# Resource Consumption Rate          
# 
# sqlite> SELECT DISTINCT OriginalTraitName
#    ...> FROM TraitInfo
#    ...> WHERE OriginalTraitName LIKE "Resource%";
# 
# OriginalTraitName                       
# ----------------------------------------
# Resource Consumption Rate               
# Resource Mass Consumption Rate          
# Resource Reaction Distance              
# Resource Habitat Encounter Rate         
# Resource Consumption Probability        
# Resource Mobility Selection             
# Resource Size Selection                 
# Resource Size Capture Intent Acceptance 
# Resource Encounter Rate                 
# Resource Escape Response Probability 
# 
# sqlite> SELECT DISTINCT OriginalTraitName
#    ...> FROM TraitInfo
#    ...> WHERE OriginalTraitName GLOB "Resource*";
# 
# 
# OriginalTraitName                       
# ----------------------------------------
# Resource Consumption Rate               
# Resource Mass Consumption Rate          
# Resource Reaction Distance              
# Resource Habitat Encounter Rate         
# Resource Consumption Probability        
# Resource Mobility Selection             
# Resource Size Selection                 
# Resource Size Capture Intent Acceptance 
# Resource Encounter Rate                 
# Resource Escape Response Probability 
# 
# # NOTE THAT GLOB IS CASE SENSITIVE, WHILE LIKE IS NOT
# 
# sqlite> SELECT DISTINCT OriginalTraitName
#    ...> FROM TraitInfo
#    ...> WHERE OriginalTraitName LIKE "resource%";
# 
# OriginalTraitName                       
# ----------------------------------------
# Resource Consumption Rate               
# Resource Mass Consumption Rate          
# Resource Reaction Distance              
# Resource Habitat Encounter Rate         
# Resource Consumption Probability        
# Resource Mobility Selection             
# Resource Size Selection                 
# Resource Size Capture Intent Acceptance 
# Resource Encounter Rate                 
# Resource Escape Response Probability 
# ```

# We can also order by any column:

# ```bash
# sqlite> SELECT OriginalTraitName, Habitat FROM 
#    ...>  TraitInfo LIMIT 5;
# 
# OriginalTraitName          Habitat   
# -------------------------  ----------
# Resource Consumption Rate  freshwater
# Resource Consumption Rate  freshwater
# Resource Consumption Rate  freshwater
# Resource Mass Consumption  freshwater
# Resource Mass Consumption  freshwater
# 
# sqlite> SELECT OriginalTraitName, Habitat FROM 
#    ...> TraitInfo ORDER BY OriginalTraitName LIMIT 5;
# 
# OriginalTraitName           Habitat   
# --------------------------  ----------
# 48-hr Hatching Probability  marine    
# Asexual Reproduction Rate   marine    
# Attack Body Acceleration    marine    
# Attack Body Velocity        marine    
# Attack Body Velocity        marine  
#  ```

# Until now we have just queried data from one single table, but as we
# have seen, the point of storing a database in SQL is that we can use
# multiple tables minimizing redundancies within them. And of course,
# querying data from those different tables at the same time will be
# necessary at some point.
# 
# Let's import then one more table to our database:

# ```bash
# sqlite> CREATE TABLE Consumer (Numbers integer primary key,
#   ...>                                OriginalID text,
#   ...>                                FinalID text,
#   ...>                                Consumer text,
#   ...>                                ConCommon text,
#   ...>                                ConKingdom text,
#   ...>                                ConPhylum text,
#   ...>                                ConClass text,
#   ...>                                ConOrder text,
#   ...>                                ConFamily text,
#   ...>                                ConGenus text,
#   ...>                                ConSpecies text);
# ```

# ```bash
# sqlite> .import Consumer.csv Consumer
# ```
# Now we have two tables in our database:
# 
# ```bash
# sqlite> .tables
# Consumer   TraitInfo
# ```
# 
# These tables are connected by two different keys: `OriginalID` and `FinalID`. These are unique IDs for each thermal curve. For each `FinalID` we can get the trait name (`OriginalTraitName`) from the `TraitInfo` table and the corresponding species name (`ConSpecies`) from the `Consumer` table.

# ```bash
# sqlite> SELECT A1.FinalID, A1.Consumer, A2.FinalID,  A2.OriginalTraitName
#    ...> FROM Consumer A1, TraitInfo A2
#    ...> WHERE A1.FinalID=A2.FinalID LIMIT 8;
# 
# FinalID     Consumer               FinalID     OriginalTraitName        
# ----------  ---------------------  ----------  -------------------------
# MTD1        Chaoborus trivittatus  MTD1        Resource Consumption Rate
# MTD2        Chaoborus trivittatus  MTD2        Resource Consumption Rate
# MTD3        Chaoborus americanus   MTD3        Resource Consumption Rate
# MTD4        Stizostedion vitreum   MTD4        Resource Mass Consumption
# MTD5        Macrobrachium rosenbe  MTD5        Resource Mass Consumption
# MTD6        Ranatra dispar         MTD6        Resource Consumption Rate
# MTD7        Ceriodaphnia reticula  MTD7        Mass-Specific Mass Consum
# MTD8        Polyphemus pediculus   MTD8        Voluntary Body Velocity 
# 
# # In the same way we assign alias to variables, we can use them for tables.
# ```

# This example seems easy because both tables have the same number of rows. But the query is still as simple when we have tables with different rows.
# 
# Let's import the TCP table:

# ```bash
# sqlite> CREATE TABLE TCP (Numbers integer primary key,
#    ...>                           OriginalID text,
#    ...>                           FinalID text,
#    ...>                           OriginalTraitValue integer,
#    ...>                           OriginalTraitUnit text,
#    ...>                           LabGrowthTemp integer,
#    ...>                           LabGrowthTempUnit text,   
#    ...>                           ConTemp integer,
#    ...>                           ConTempUnit text,
#    ...>                           ConTempMethod text,
#    ...>                           ConAcc text,
#    ...>                           ConAccTemp integer);
# 
# sqlite> .import TCP.csv TCP
# sqlite> .tables
# Consumer   TCP        TraitInfo
# ```
# 
# Now imagine we want to query the thermal performance curves that we have stored for the species Mytilus edulis. Using the FinalID to match the tables, the query can be as simple as:
# 
# ```bash
# sqlite> CREATE TABLE TCP (Numbers integer primary key,
#    ...>                           OriginalID text,
#    ...>                           FinalID text,
#    ...>                           OriginalTraitValue integer,
#    ...>                           OriginalTraitUnit text,
#    ...>                           LabGrowthTemp integer,
#    ...>                           LabGrowthTempUnit text,   
#    ...>                           ConTemp integer,
#    ...>                           ConTempUnit text,
#    ...>                           ConTempMethod text,
#    ...>                           ConAcc text,
#    ...>                           ConAccTemp integer);
# 
# sqlite> .import TCP.csv TCP
# sqlite> .tables
# Consumer   TCP        TraitInfo
# 
#                        
# 
# sqlite> SELECT A1.ConTemp, A1.OriginalTraitValue, A2.OriginalTraitName, A3.Consumer
#    ...> FROM TCP A1, TraitInfo A2, Consumer A3
#    ...> WHERE A1.FinalID=A2.FinalID AND A3.ConSpecies="Mytilus edulis" AND A3.FinalID=A2.FinalID LIMIT 8
# 
# ConTemp     OriginalTraitValue    OriginalTraitName               Consumer            
# ----------  --------------------  ------------------------------  --------------------
# 25          2.707075              Filtration Rate                 Mytilus edulis      
# 20          3.40721               Filtration Rate                 Mytilus edulis      
# 5           3.419455              Filtration Rate                 Mytilus edulis      
# 15          3.711165              Filtration Rate                 Mytilus edulis      
# 10          3.875465              Filtration Rate                 Mytilus edulis      
# 5           0.34                  In Vitro Gill Particle Transpo  Mytilus edulis      
# 10          0.46                  In Vitro Gill Particle Transpo  Mytilus edulis      
# 15          0.595                 In Vitro Gill Particle Transpo  Mytilus edulis
# ```

# So on and so forth (joining tables etc. would come next...). But if you want to keep practicing and learn more about sqlite commands, this is a very useful site: <http://www.sqlite.org/sessions/sqlite.html>. You can
# store your queries and database management commands in an ` .sql` file (`geany` will take care of syntax highlighting etc.)
# 
# ## SQLite with Python
# 
# It is easy to access, update and manage SQLite databases with Python (you will find this script file in the `code` directory):
# 
# ```python
# import sqlite3
# 
# conn = sqlite3.connect(":memory:")
# 
# c = conn.cursor()
# 
# c.execute("CREATE TABLE tt (Val TEXT)")
# 
# conn.commit()
# 
# z = [('a',), ('ab',), ('abc',), ('b',), ('c',)]
# 
# c.executemany("INSERT INTO tt VALUES (?)", z)
# 
# conn.commit()
# 
# c.execute("SELECT * FROM tt WHERE Val LIKE 'a%'").fetchall()
# 
# conn.close()
# ```
# 
# You can create a database in memory, without using the disk — thus you can create and discard an SQLite database within your workflow!

# Readings and Resources
# ----------------------
# 
# * "The Definitive Guide to SQLite" is a pretty complete guide to SQLite and freely available from [here]( 
#     http://sd.blackball.lv/library/The_Definitive_Guide_to_SQLite_2nd_edition.pdf)
# 
# * For databses in general, try the [Stanford Introduction to Databases course](https://www.coursera.org/course/db)
# 
# * A set of sqlite tutorials in Jupyter: https://github.com/royalosyin/Practice-SQL-with-SQLite-and-Jupyter-Notebook 
