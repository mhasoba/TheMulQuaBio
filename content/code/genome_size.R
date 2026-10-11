# Linear Modelling Practical

# This script uses genome size and morphology data to explore
# t tests and F tests in R


######################## (1) ##########################
# LOAD THE DATA FrOM THE CSV TEXT FILE INTO A DATA FrAME:
genome <- read.csv('../data/genome_size.csv') #assumes that you are working from your Code directory

######################## (2) ##########################
# LOOK AT AND MANIPULATE THE DATA:

head(genome)
str(genome) # Check what the data columns contain

tapply(genome$BodyWeight, genome$Suborder, mean) # take a quick mean
tapply(genome$BodyWeight, genome$Suborder, mean, na.rm=TrUE)
tapply(genome$BodyWeight, genome$Suborder, length)
tapply(genome$BodyWeight, genome$Suborder, var, na.rm=TrUE)

#You can also remove NA's by subsetting (using weight as an example):
BodyWt_no_NA <- subset(genome, !is.na(BodyWeight))
str(BodyWt_no_NA) 

######################## (3) ##########################
# LOOK AT A SUMMArY OF THE DATA:

summary(genome) #Note that each column gets a separate summary!

######################## (4) ##########################
# VISUALISE THE DISTrIBUTION OF THE SAMPLES OF YOUr FOCAL VArIABLE:

hist(genome$genome_size, breaks=10)
plot(density(genome$genome_size, bw=0.1))

######################## (5) ##########################
# COMPArE TWO DISTrIBUTIONS OF FACTOrS OF INTErEST USING BOXPLOTS:

plot(genome_size ~ Suborder, data=genome) 
#You can also use plot(Genome$genome_size ~ Genome$Suborder)   

######################## (6) ##########################
# COMPArE THE TWO DISTrIBUTIONS USING DENSITY PLOTS:

# First, get two small datasets, one for each order
Anisoptera <- subset(genome, Suborder=='Anisoptera') #The dragonflies
Zygoptera <- subset(genome, Suborder=='Zygoptera') #The damselflies

# Now plot the first suborder and add a line for the second, adjusting 
# x and y axis limits to accommodate both curves
plot(density(Zygoptera$genome_size), xlim=c(0.1, 2.7), ylim=c(0,1.7))
lines(density(Anisoptera$genome_size), col='red')

######################## (7) ##########################
# PLOT ONE VArIABLE AGAINST ANOTHEr USING SCATTErPLOTS:

hist(genome$TotalLength) #Check the distribution of your new variable of interest
plot(genome_size ~ TotalLength, data = genome) #Now plot

plot(genome_size ~ BodyWeight, data = genome) #Another example, using weight instead 

######################## (8) ##########################
# SEPArATE SCATTErS BY SUBOrDErS

str(genome$Suborder) #Confirm that there are two levels under suborders 
myColours <- c('red', 'blue') # So choose two colours
mySymbols <- c(1,3) # And two different markers

plot(genome_size ~ TotalLength , data = genome, #Now plot again
	col = myColours[Suborder], pch = mySymbols[Suborder],
	xlab='Total length (mm)', ylab='Genome size (pg)')
	
legend(40,2, legend=levels(genome$Suborder), #Add legend at coordinate 40,2
	col= myColours, pch = mySymbols)

######################## (9) ##########################
# SAVE FILE AS A PDF:

pdf('../results/genome_size.pdf', height=5, width=6) #Open the pdf file

plot(genome_size ~ TotalLength , data = genome, 
	col=myColours[Suborder], pch=mySymbols[Suborder],
	xlab='Total length (mm)', ylab='Genome size (pg)')
legend(40,2, legend=levels(genome$Suborder),
	col= myColours, pch = mySymbols)

dev.off() #Close the pdf file

######################## (10) ##########################
# SAVE THE DATA AND YOUr NEW VArIABLES IN rDATA FOrMAT:
save(genome, myColours, mySymbols, file='../results/genome_size.rda')
