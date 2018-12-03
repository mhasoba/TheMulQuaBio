dat <- read.csv('genome_size_data_061112_02-10-18.csv', skip=5, stringsAsFactors=FALSE)

# chop up the species names into bits
speciesnames <- strsplit(dat$Species, ' ')
nameparts <- sapply(speciesnames, length)
table(nameparts)

# there are some sp. records but they won't match 
# to Pantheria so don't worry about them
# - do need to turn the C.values into numbers though
# - there is a range for one record
dat$C.value <- as.numeric(dat$C.value)


# check for non binomial/trinomial and ditch these (hybrids)
dat[! nameparts %in% c(2,3),]
dat <- dat[nameparts %in% c(2,3),]

# repeat the names splitting for the reduced set
speciesnames <- strsplit(dat$Species, ' ')
nameparts <- sapply(speciesnames, length)
table(nameparts)

# get binomials for merging multiple records for one species
dat$Binomial <- sapply(speciesnames, function(X) paste(X[1:2], collapse=' '))


# reduce to a species average, N and sd.
spAVG <- tapply(dat$C.value, dat$Binomial, mean)
# spN <- tapply(dat$C.value, dat$Binomial, length)
# spSD <- tapply(dat$C.value, dat$Binomial, sd)

# species data frame

spDat <- data.frame(Binomial=names(spAVG), meanCvalue=as.vector(spAVG)) 
					# N.C=as.vector(spN)) , sd.C=as.vector(spSD))
str(spDat)

# match to Pantheria
pantheria <- read.delim('PanTHERIA_1-0_WR93_Aug2008.txt', na.string='-999')
pantheria <- subset(pantheria, select=c(MSW93_Order,  MSW93_Binomial, X5.1_AdultBodyMass_g, X6.1_DietBreadth, 
                                        X12.1_HabitatBreadth, X15.1_LitterSize, X12.2_Terrestriality, X6.2_TrophicLevel))
str(pantheria)
table(is.na(match(spDat$Binomial, pantheria$MSW93_Binomial)))
spDat <- merge(spDat, pantheria, by.x='Binomial', by.y='MSW93_Binomial')

# joint completeness of pantheria
xx <- ! is.na(spDat[,-1:-4])
str(xx)
t(xx) %*% xx
sum(complete.cases(spDat))

# tidy up  the data
names(spDat) <- c("Binomial", "meanCvalue" ,"Order", "AdultBodyMass_g", "DietBreadth", 
                  "HabitatBreadth", "LitterSize", "GroundDwelling",  "TrophicLevel")

# label the factors
spDat$GroundDwelling <- factor(spDat$GroundDwelling, labels=c('Yes', 'No'))
spDat$TrophicLevel <- factor(spDat$TrophicLevel, labels=c('Herbivore', 'Omnivore', 'Carnivore'))
write.table(spDat, file='MammalData.csv', sep=',', row.names=FALSE)

