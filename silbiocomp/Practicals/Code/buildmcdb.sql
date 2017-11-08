/* 
Create the table communities
The fields are:

IDcommunity: integer, primary key
IDsite: integer
year: real
IDspecies: text
presence: integer
abundance: real
mass: real
*/

CREATE TABLE communities (
    IDcommunity INTEGER PRIMARY KEY,
    IDsite INTEGER,
    year REAL,
    IDspecies TEXT,
    presence INTEGER,
    abundance REAL,
    mass REAL);
    
/* Now populate the table from the csv */
.separator ","
.import ../Data/MCDB/communities.csv communities

/* 
Create the table references
The fields are:
IDref: text, pk
refer: text
authors: text
pubyear: integer
title: text
source: text
*/

CREATE TABLE reference (
    IDref TEXT,
    refer TEXT,
    authors TEXT,
    pubyear INTEGER,
    title TEXT,
    source TEXT);
    
/* Now populate the table from the csv */
.separator ","
.import ../Data/MCDB/references.csv reference


/* 
Create the table species
The fields are:
IDspecies text, pk
family text 
genus text 
sp text
splevel integer
*/

CREATE TABLE species (
    IDspecies TEXT PRIMARY KEY,
    family TEXT,
    genus TEXT,
    sp TEXT,
    splevel INTEGER);
    

/* Now populate the table from the csv */
.separator ","
.import ../Data/MCDB/species.csv species

/* 
Create the table sites
The fields are:
IDsite integer, pk
IDreference text
location text
country text
state text
latitude real
longitude real
*/

CREATE TABLE sites (
    IDsite INTEGER PRIMARY KEY,
    IDreference TEXT,
    location TEXT,
    country TEXT,
    state TEXT,
    latitude REAL,
    longitude REAL);
    
/* Now populate the table from the csv */
.separator ","
.import ../Data/MCDB/sites.csv sites

