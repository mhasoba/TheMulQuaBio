CREATE VIEW bigtb AS
SELECT * FROM
communities cc 
INNER JOIN sites ss
ON cc.IDsite = ss.IDsite
INNER JOIN species sp
ON cc.IDspecies = sp.IDspecies
INNER JOIN reference rr
ON ss.IDreference = rr.IDref;

