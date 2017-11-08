"""
	A script that creates an SQLite database of biotraits from a csv file.
"""

# Import the sqlite3 library.
import sqlite3, csv

# Create the database and connect to it.
conn = sqlite3.connect('../Results/biotraitsdb')

# Create a cursor to execute SQL commands.
c = conn.cursor()

# Return bytestrings, rather than utf8 strings.
conn.text_factory = str

# Create the table and the appropriate fields.
c.execute("""CREATE TABLE biotraits (
			DataSeriesID INTEGER, 
			Trait TEXT, 
			TraitDef TEXT, 
			TraitOrg TEXT, 
			AmbientTemp REAL, 
			TraitValueSI REAL, 
			TraitUnitSI TEXT, 
			ErrorPosSI REAL, 
			ErrorNegSI REAL, 
			ErrorUnitSI TEXT, 
			Replicates INTEGER, 
			Habitat TEXT, 
			LabField TEXT, 
			ArenaValueSI REAL, 
			ArenaUnitSI TEXT, 
			ObsTimeValueSI REAL, 
			ObsTimeUnitSI TEXT, 
			ObsTimeNotes TEXT, 
			ResRepValueSI REAL, 
			ResRepUnitSI TEXT, 
			Location TEXT, 
			Latitude REAL, 
			Longitude REAL, 
			TaxaPresent TEXT, 
			ConType TEXT, 
			Con TEXT, 
			ConCommon TEXT, 
			ConStage TEXT, 
			ConIDLevel TEXT, 
			ConKingdom TEXT, 
			ConPhylum TEXT, 
			ConClass TEXT, 
			ConOrder TEXT, 
			ConFamily TEXT, 
			ConTrophic TEXT, 
			ConThermy TEXT, 
			ConTemp REAL, 
			ConTempMethod TEXT, 
			ConMassValueSI REAL, 
			ConMassUnitSI TEXT, 
			ConDenValueSI REAL, 
			ConDenTypeSI TEXT, 
			ConDenUnitSI TEXT, 
			ResType TEXT, 
			Res TEXT, 
			ResCommon TEXT, 
			ResStage TEXT, 
			ResIDLevel TEXT, 
			ResKingdom TEXT, 
			ResPhylum TEXT, 
			ResClass TEXT, 
			ResOrder TEXT, 
			ResFamily TEXT, 
			ResTrophic TEXT, 
			ResThermy TEXT, 
			ResTemp REAL, 
			ResTempMethod TEXT, 
			ResMassValueSI REAL, 
			ResMassUnitSI TEXT, 
			ResDenValueSI REAL, 
			ResDenTypeSI TEXT, 
			ResDenUnitSI TEXT, 
			CitationID INTEGER, 
			Citation TEXT, 
			FigureTable TEXT
			);""")

# Commit the change.
conn.commit()

# Import BytesIO to decode and re-encode text.
from io import BytesIO

# Open the input file.
with open('../Data/biotraits.txt', "rb") as tsv:
	
	# Decode from utf-16 and encode to utf-8.
	conv = tsv.read().decode('utf-16').encode('utf-8')
	
	FirstLine = True
	
	# Go through the text, one row at a time.
	for row in csv.reader(BytesIO(conv), dialect="excel-tab"):
		
		# Skip the first line.
		if FirstLine:
			FirstLine = False
		
		# Insert the values into the table.
		else:
			c.execute("""Insert into biotraits Values (
					?, ?, ?, ?, ?, ?, ?, ?, ?, ?,
					?, ?, ?, ?, ?, ?, ?, ?, ?, ?,
					?, ?, ?, ?, ?, ?, ?, ?, ?, ?,
					?, ?, ?, ?, ?, ?, ?, ?, ?, ?,
					?, ?, ?, ?, ?, ?, ?, ?, ?, ?,
					?, ?, ?, ?, ?, ?, ?, ?, ?, ?,
					?, ?, ?, ?, ?);""", row)

# Commit changes and close the connection.
conn.commit()
conn.close()
