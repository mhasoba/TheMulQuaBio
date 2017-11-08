#!/usr/bin/Rscript

library(ggplot2)
library(graphics)
library(MASS)
library(stringi)

#####################################
# F   U   N   C   T   I   O   N   S #
#####################################

my_mad <- function(x)
{
	y <- c()
	for (i in 1:length(x))
	{
		y <- c(y, abs(x[i] - median(x)))
	}
	return(median(y))
}

# Gaussian - Gompertz model
GauGo <- function(Trait_max, E, E_D, T_pk, temp, theta = 8){

	# Parameters
	# Trait_max : Maximum value of the trait
	# E         : Activation energy
	# E_D       : De-Activation energy
	# T_pk      : Temp at which trait reaches peak value
	# theta     : fit improving value

    return(log(Trait_max * exp((-E) * (temp - T_pk) * (temp - T_pk) - exp(E_D * (temp - 
        T_pk) - theta))))
}

# Johnson-Lewin model
JoLe <- function(B0, E, E_D, T_pk, temp){

    # Parameters
    # B0   : Trait performance at low temperature
    # E    : Activation energy
    # E_D  : De-Activation energy
    # T_pk : Temp at which trait reaches peak value

    return(log(B0 * exp(-E/(k * temp))/(1 + exp((1/k) * (((E_D/T_pk) + k * log(E/(E_D - 
        E))) - (E_D/temp))))))
}

# Schoolfield model
schoolf <- function(B0, E, E_D, T_pk, temp)
{
    # Parameters
    # B0     : Trait performance at low temperature
    # E      : Activation energy 
    # E_D    : De-Activation energy 
    # T_pk   : T at which enzyme is 50% active and 50% high-temperature suppressed
    
	return(log(B0 * exp(-E * ((1/(k*temp)) - (1/(k*283.15))))/(1 + (E/(E_D - E)) * exp(E_D/k * (1/T_pk - 1/temp)))))
}

######################
# M A I N    C O D E #
######################

# Load the input dataset of thermal response curves.
dataset <- read.delim("../Results/results.csv", sep = "\t", stringsAsFactors=FALSE)

# Keep only the estimates for one model.
#dataset <- dataset[dataset$Model_name == "Gaussian - Gompertz",]
#dataset <- dataset[dataset$Model_name == "Johnson - Lewin",]
#dataset <- dataset[dataset$Model_name == "Schoolfield",]

# Specify the output directory.
ODir <- "../Results/curves/"

# Assign the Boltzmann constant (units of eV * K^−1) as a global 
assign("k", 8.617 * 10^-5, envir = .GlobalEnv)

# Iterate over the thermal response curves.
for (i in 1:nrow(dataset))
{

		# Get the original species name.
		organism <- dataset[i, "Species_orig"]
		
		# Get the reference for this curve.
		ref <- dataset[i, "Reference"]		
		
		# Get latitude and longitude.
		lat <- dataset[i,"Latitude"]
		lon <- dataset[i,"Longitude"]
		
		# Create a unique ID using:
		#	- the original species name
		#   - the reference
		#   - latitude
		#   - longitude
		id <- paste(organism, ref, lat, lon, sep = "_")
		
		# Remove any characters that won't look good in a filename.
		id <- gsub("[^\\w|\\s](|)", "", id, perl=TRUE)
		
		# Convert spaces to underscores.
		id <- gsub("\\s+", "_", id, perl=TRUE)
		
		# Get vectors of temperature and trait values.
		temp_vals <- as.numeric(strsplit(dataset[i, "Temp_Vals"], ",")[[1]])
		trait_vals <- as.numeric(strsplit(dataset[i, "Trait_Vals"], ",")[[1]])
		
		# Get the B0 value for this curve.
		B0 <- as.numeric(dataset[i, "B0"])
		
		# Get the E value for this curve.
		E <- as.numeric(dataset[i, "E"])

		# Get the E_D value for this curve.
		E_D <- as.numeric(dataset[i, "E_D"])

		# Get the T_pk value for this curve.
		T_pk <- as.numeric(dataset[i, "T_pk"])
		
		# Get the theta value for this curve.
		theta <- as.numeric(dataset[i, "Theta"])
		
		# Get the R-squared value for this curve.
		rsq <- as.numeric(dataset[i, "R_Squared"])

        ###### PLOTTING ######
        
        # Prepare the data points of the original values.
        DataToPlot <- data.frame(Temperature = temp_vals, TraitValue = trait_vals)

		# Prepare the fitted line.
		if (dataset[i, "Model_name"] == "Gaussian - Gompertz")
		{
			temps <- seq(min(floor(temp_vals)), ceiling(max(temp_vals)), length = 200)
            model <- exp(GauGo(max(trait_vals), E, E_D, T_pk, temps, theta))
                
            ModelToPlot <- data.frame(Temperature = temps - 273.15, TraitValue = model)		
		} else if (dataset[i, "Model_name"] == "Johnson - Lewin")
		{
			temps <- 273.15 + seq(min(floor(temp_vals)), ceiling(max(temp_vals)), length = 200)
            model <- exp(JoLe(B0, E, E_D, T_pk + 273.15, temps))
                
            ModelToPlot <- data.frame(Temperature = temps - 273.15, TraitValue = model)
		}else if (dataset[i, "Model_name"] == "Schoolfield")
        {
            temps <- 273.15 + seq(min(floor(temp_vals)), ceiling(max(temp_vals)), length = 200)
            model <- exp(schoolf(B0, E, E_D, T_pk + 273.15, temps))
                
            ModelToPlot <- data.frame(Temperature = temps - 273.15, TraitValue = model)
        }
		
		# Use ggplot magic!
        p <- ggplot() + geom_point(data = DataToPlot, aes(x = Temperature, 
				y = TraitValue), size = 3, col = "black", bg = "lightcyan2", alpha = 0.7, pch = 21) + 
			geom_line(data = ModelToPlot, 
				aes(x = Temperature, y = TraitValue), colour = "#1b9e77", lwd = 1.3) + 
			ggtitle(organism) +
            xlab(expression(paste("Temperature (", degree, C, ")"))) + 
            ylab(bquote("Growth rate" ~ "(" * s^-1 ~ "·" ~ cell^-1 * ")")) +
            theme_bw() + theme(plot.title = element_text(size = 12), 
				axis.title = element_text(size = 10)) +
			annotate("text", size = element_text(size = 10), label = 
				paste("italic(R^2==", sprintf("%.2f", rsq), ")", sep = ""), 
				x = max(temp_vals)  - 0.85 * (max(temp_vals) - min(temp_vals)), 
				y = max(trait_vals) - 0.05 * (max(trait_vals) - min(trait_vals)),
				parse = TRUE, fontface = 3)

		# Save it as an svg file.
		svg_file <- paste(ODir, gsub("/|#", "", id), ".svg", sep="")
        ggsave(filename = svg_file, plot = p, height = 4, width = 4.2)          
}
