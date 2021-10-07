# Practical

# This script uses genome size and morphology data to learn some data 
# exploration techniques

######################## (1) ##########################
# LOAD THE DATA FROM THE CSV TEXT FILE INTO A DATA FRAME:
genome <- read.csv('../data/GenomeSize.csv', , stringsAsFactors = T) #assumes that you are working from your Code directory

######################## (2) ##########################
# LOOK AT AND MANIPULATE THE DATA:

head(genome)
str(genome) # Check what the data columns contain

tapply(genome$BodyWeight, genome$Suborder, mean) # take a quick mean
tapply(genome$BodyWeight, genome$Suborder, mean, na.rm=TRUE)
tapply(genome$BodyWeight, genome$Suborder, length)
tapply(genome$BodyWeight, genome$Suborder, var, na.rm=TRUE)

#You can also remove NA's by subsetting (using weight as an example):
BodyWt_no_NA <- subset(genome, !is.na(BodyWeight))
str(BodyWt_no_NA)

######################## (3) ##########################
# LOOK AT A SUMMARY OF THE DATA:

summary(genome) #Note that each column gets a separate summary!

######################## (4) ##########################
# VISUALISE THE DISTRIBUTION OF THE SAMPLES OF YOUR FOCAL VARIABLE:

hist(genome$GenomeSize, breaks=10)
plot(density(genome$GenomeSize, bw=0.1))

######################## (5) ##########################
# COMPARE TWO DISTRIBUTIONS OF FACTORS OF INTEREST USING BOXPLOTS:

plot(GenomeSize ~ Suborder, data=genome) 
#You can also use plot(Genome$GenomeSize ~ Genome$Suborder)   

######################## (6) ##########################
# COMPARE THE TWO DISTRIBUTIONS USING DENSITY PLOTS:

# First, get two small datasets, one for each order
Anisoptera <- subset(genome, Suborder=='Anisoptera') #The dragonflies
Zygoptera <- subset(genome, Suborder=='Zygoptera') #The damselflies

# Now plot the first suborder and add a line for the second, adjusting 
# x and y axis limits to accommodate both curves
plot(density(Zygoptera$GenomeSize), xlim=c(0.1, 2.7), ylim=c(0,1.7))
lines(density(Anisoptera$GenomeSize), col='red')

######################## (7) ##########################
# PLOT ONE VARIABLE AGAINST ANOTHER USING SCATTERPLOTS:

hist(genome$TotalLength) #Check the distribution of your new variable of interest
plot(GenomeSize ~ TotalLength, data = genome) #Now plot

plot(GenomeSize ~ BodyWeight, data = genome) #Another example, using weight instead 

######################## (8) ##########################
# SEPARATE SCATTERS BY SUBORDERS

str(genome$Suborder) #Confirm that there are two levels under suborders 
myColours <- c('red', 'blue') # So choose two colours
mySymbols <- c(1,3) # And two different markers

plot(GenomeSize ~ TotalLength , data = genome, #Now plot again
	col = myColours[Suborder], pch = mySymbols[Suborder],
	xlab='Total length (mm)', ylab='Genome size (pg)')
	
legend(40,2, legend=levels(genome$Suborder), #Add legend at coordinate 40,2
	col= myColours, pch = mySymbols)

######################## (9) ##########################
# SAVE FILE AS A PDF:

pdf('../results/GenomeSize.pdf', height=5, width=6) #Open the pdf file

plot(GenomeSize ~ TotalLength , data = genome, 
	col=myColours[Suborder], pch=mySymbols[Suborder],
	xlab='Total length (mm)', ylab='Genome size (pg)')
legend(40,2, legend=levels(genome$Suborder),
	col= myColours, pch = mySymbols)

dev.off() #Close the pdf file

######################## (10) ##########################
# SAVE THE DATA AND YOUR NEW VARIABLES IN RDATA FORMAT:
save(genome, myColours, mySymbols, file='../Results/GenomeSize.Rda')
