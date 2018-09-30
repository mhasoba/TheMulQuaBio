#!/usr/bin/env python

# This code performs non-linear least squares fitting of different
# unimodal functions to experimental thermal response curves.
# Scroll down to the section called "MAIN CODE" first.

from bigfloat import log, exp
from collections import OrderedDict
from lmfit import minimize, Parameters, Parameter, report_fit
from math import pi
from scipy.stats import linregress

import csv
import numpy
import re
import sys

#############################
# F  U  N  C  T  I  O  N  S #
#############################


def unique(seq):
    """Filter duplicate items in a list."""
    seen = {}
    result = []

    # For every item ...
    for item in seq:

            # ... if not previously seen ...
        if tuple(item) not in seen:
            seen[tuple(item)] = 1

            # ... append it to the filtered list.
            result.append(item)

    # Return the filtered list.
    return result


def AICrss(n, k, rss):
	"""Calculate the Akaike Information Criterion value, using:

	- n:   number of observations
	- k:   number of parameters
	- rss: residual sum of squares
	"""

	return n * log((2 * pi) / n) + n + 2 + n * log(rss) + 2 * k


def BICrss(n, k, rss):
	"""Calculate the Bayesian Information Criterion value, using:
	
	- n:   number of observations
	- k:   number of parameters
	- rss: residual sum of squares
	"""

	return n + n * log(2 * pi) + n * log(rss / n) + (log(n)) * (k + 1)


def HQCrss(n, k, rss):
	"""Calculate the Hannan-Quinn information Criterion value, using:
	
	- n:   number of observations
	- k:   number of parameters
	- rss: residual sum of squares
	"""

	return n * log(rss / n) + 2 * k * log(log(n))


def best_model(vals):
    """Decide on the best model according to an Information Criterion."""

    if vals[0] is not None and vals[0] == min(x for x in vals if x is not None):
        return 1
    elif vals[1] is not None and vals[1] == min(x for x in vals if x is not None):
        return 2
    elif vals[2] is not None and vals[2] == min(x for x in vals if x is not None):
        return 3
    else:
        return 0


def create_ids(data):
    """Generate IDs for the species in the dataset, by combining:
    - original species name
    - trait
    - reference
    - latitude
    - longitude"""

    ids = {}

    for row in data:
        species = row[0]
        reference = row[2]
        trait = row[3]
        lat = row[7]
        lon = row[8]

        ids[species + reference + trait +
            str(lat) + str(lon)] = [species, reference, trait, lat, lon]

    return ids


def gen_starting_values(dataset):
    """Obtain starting values for non-linear least squares fitting."""

    # Maximum trait value
    global max_trait
    max_trait = get_max_trait(dataset)

    # Peak temperature
    T_pk_start = get_T_pk(dataset, max_trait)

    # Get only the subset of the dataset until the peak temperature.
    dataset_up_to_peak = get_dataset_up_to_peak(dataset, T_pk_start)

    # Get the trait value at minimum temperature (B0).
    B0_start = get_B0(dataset_up_to_peak)

    # Use arbitrary E and E_D values if no data points
    # before the peak were available.
    if len(dataset_up_to_peak) == 0:
        E_start = 10
        E_D_start = 30

    # Otherwise, estimate the activation energy (E) and
    # de-activation energy (E_D).
    else:
        (E_start, E_D_start) = get_E_and_E_D(dataset_up_to_peak)

    return (max_trait, T_pk_start + 273.15, B0_start, E_start, E_D_start)


def get_E_and_E_D(dataset):
    """Estimate E and E_D using linear regression."""

    global K

    temps = []
    trait_vals = []

    # Convert temps to 1/K*(temps + 273.15).
    for row in dataset:
        temps.append(1 / (K * (float(row[4]) + 273.15)))
        trait_vals.append(log(float(row[5])))

    # Perform a regression of temps vs trait_vals.
    (slope, intercept, r_value, p_value, std_err) = linregress(temps,
                                                               trait_vals)

    # Return arbitrary values if the regression was not successful.
    if numpy.isnan(slope):
        return 10, 30

    # Otherwise, return the slope as E and slope * 10 as E_D.
    else:
        return abs(slope), abs(slope) * 10


def get_B0(dataset):
    """Get the trait value at the minimum temperature."""

    # Initialize the temperature variable at a very high number.
    min_temp = 9999

    # Get the minimum temperature value.
    for row in dataset:
        min_temp = min(min_temp, float(row[4]))

    # Initialize the trait variable at a very high number.
    min_trait = 999999

    # Get the value at the minimum temperature.
    for row in dataset:
        if float(row[4]) == min_temp:
            min_trait = min(min_trait, float(row[5]))

    return min_trait

def get_dataset_up_to_peak(dataset, peak_temp):
    """Get only the data points before the peak temperature."""
    dataset_up_to_peak = []

    for row in dataset:
        if float(row[4]) < peak_temp:
            dataset_up_to_peak.append(row)

    return dataset_up_to_peak


def get_max_trait(dataset):
    """Get the maximum reported value of the trait."""

    # Initialize the variable at a very low number.
    max_trait = -999

    # Compare the variable with each measurement and keep the max value.
    for row in dataset:
        max_trait = max(max_trait, float(row[5]))

    return max_trait


def get_T_pk(dataset, max_trait):
    """Get the temperature at the maximum trait value."""
    max_temps = []

    for row in dataset:
        if float(row[5]) == max_trait:
            max_temps.append(float(row[4]))

    # If multiple temperatures had the maximum trait value,
    # return the mean temperature.
    return numpy.mean(max_temps)


def get_specific_data(data, species, ref, trait, lat, lon):
    """Gets a subset of the original dataset with only the data
    for a particular species ID."""

    specific_data = []

    # Make sure that all the data correspond to that particular species ID
    # and that a trait value is specified.
    for row in data:
				if row[0] == species and row[2] == ref and row[3] == trait and 
				row[7] == lat and row[8] == lon and row[5] != "NA" and 
				float(row[5]) > 0:
            specific_data.append(row)

    # Remove duplicate data points (if any).
    specific_data = unique(specific_data)

    return specific_data


def gaugo_model(dataset, E_start, T_pk_start, E_D_start):
    """Prepare the Gaussian - Gompertz model."""

    # Store temperatures and log-transformed trait values.
    temps = []
    trait_vals = []

    for row in dataset:
        temps.append(float(row[4]))
        trait_vals.append(log(float(row[5])))

    # Convert temps and trait_vals to numpy arrays.
    temps = numpy.array(temps, dtype=numpy.float64)
    trait_vals = numpy.array(trait_vals, dtype=numpy.float64)

    # Prepare the parameters and their bounds.
    params = Parameters()
    params.add('theta', value=7)
    params.add('E', value=E_start, min=0.00001, max=30)
    params.add('E_D', value=E_D_start, min=0.00001, max=50)
    params.add('T_pk', value=T_pk_start - 273.15, min=0, max=150)

    try:

        # Set the random seed.
        numpy.random.seed(1337)

        # Try and fit!
        minimize(GauGo, params, args=(temps, trait_vals))

    except Exception:

        # If fitting failed, return.
        return None, None, None, None

    # Since we're still here, fitting was successful!
    points_before_pk = 0
    points_after_pk = 0

	# Collect measured trait values without log transformation.
    trait_vals_no_log = []
    for row in dataset:
        trait_vals_no_log.append(float(row[5]))
        
        # Get the number of data points before and after T_pk.
        if float(row[4]) < (params['T_pk'].value):
            points_before_pk += 1
        elif float(row[4]) > (params['T_pk'].value):
            points_after_pk += 1

    # Calculate the estimated trait values.
    pred = exp(
        1) ** GauGo_eq(temps,
                       params['E'].value,
                       params['E_D'].value,
                       params['T_pk'].value,
                       params['theta'].value)
    pred = numpy.array(pred, dtype=numpy.float64)
    
    # Calculate the residual sum of squares.
    residuals = trait_vals_no_log - pred
    rss = sum(residuals ** 2)

    # If, for whatever reason, the residual sum of squares is
    # 'not a number' or infinite, then return.
    if numpy.isnan(rss) or numpy.isinf(rss):
        return None, None, None, None

    # Calculate the total sum of squares.
    tss = sum((trait_vals_no_log - numpy.mean(trait_vals_no_log)) ** 2)

    # If the total sum of squares is 0, then we have a perfect fit!
    if tss == 0:
        fit_goodness = 1
    
    # Otherwise, calculate the R-Squared value.
    else:
        fit_goodness = 1 - (rss / tss)

    # Get the values of the three Information Criteria for this fit.
    AIC_GauGo = AICrss(len(temps), 4, rss)
    BIC_GauGo = BICrss(len(temps), 4, rss)
    HQC_GauGo = HQCrss(len(temps), 4, rss)

    # Create a list of Species, Standardised Species, Reference, Trait,
    # Latitude, Longitude ...
    result_line = [
      dataset[0][0], dataset[0][1], dataset[0][2], dataset[0][3],
      dataset[0][7], dataset[0][8]
    ]

    # Temperatures ...
    temperatures = ""
    for element in temps:
        temperatures += str(element) + ','
    temperatures = temperatures[:-1]
    result_line.append(temperatures)

    # Trait Values ...
    trait_values = ""
    for element in trait_vals_no_log:
        trait_values += str(element) + ','
    trait_values = trait_values[:-1]
    result_line.append(trait_values)
		
    # No B0 and B0_stderr for this model!
    result_line.append("NA")
    result_line.append("NA")
    
    # E and E_stderr ...
    result_line.append(str(params['E'].value))
    result_line.append(str(params['E'].stderr))

    # T_pk and T_pk_stderr ...
    result_line.append(str(params['T_pk'].value))
    result_line.append(str(params['T_pk'].stderr))

    # E_D and E_D_stderr ...
    result_line.append(str(params['E_D'].value))
    result_line.append(str(params['E_D'].stderr))

    # theta and theta_stderr ...
    result_line.append(str(params['theta'].value))
    result_line.append(str(params['theta'].stderr))
    
    # R-squared ...
    result_line.append(str(fit_goodness))
    
    # Formula ...
    result_line.append(
       "log(Trait_value) = log(Trait_max * exp((-E) * (temp - T_pk) * (temp - T_pk) - exp(E_D * (temp - T_pk) - theta)))")
    
    # Model name ...
    result_line.append("Gaussian - Gompertz")
    
    # Implementation ...
    result_line.append("lmfit.minimize (Python package)")
    
    # Number of data points before and after T_pk ...
    result_line.append(str(points_before_pk))
    result_line.append(str(points_after_pk))

    return AIC_GauGo, BIC_GauGo, HQC_GauGo, result_line


def GauGo_eq(temp, E, E_D, T_pk, theta):
    """Gaussian - Gompertz model, used for estimating trait values at 
    a given temperature."""
    global max_trait

    function = max_trait * exp(1) ** (-E * (temp - T_pk) * (temp \
                         - T_pk) - exp(1) ** (E_D * (temp - T_pk) - theta))
    return numpy.array(map(log, function), dtype=numpy.float64)


def GauGo(params, temp, data):
    """Gaussian - Gompertz model, used by the optimizer."""

    global max_trait

    # Get the parameters.
    E = params['E'].value
    E_D = params['E_D'].value
    T_pk = params['T_pk'].value
    theta = params['theta'].value

    # Prevent E being higher than E_D, by punishing the optimizer with huge
    # numbers when that is the case.
    if E >= E_D:
        return 1e10

    # Otherwise, fit the model!
    function = max_trait * exp(1) ** (-E * (temp - T_pk) * (temp \
                         - T_pk) - exp(1) ** (E_D * (temp - T_pk) - theta))

    return numpy.array(map(log, function) - data, dtype=numpy.float64)

def jole_model(dataset, B0_start, E_start, T_pk_start, E_D_start):
    """Prepare the Johnson - Lewin model."""

    global K

    # Store temperatures and trait values.
    temps = []
    trait_vals = []

    for row in dataset:

        # Convert temperatures to Kelvin.
        temps.append(float(row[4]) + 273.15)
        trait_vals.append(log(float(row[5])))

    # Convert temps and trait_vals to numpy arrays.
    temps = numpy.array(temps, dtype=numpy.float64)
    trait_vals = numpy.array(trait_vals, dtype=numpy.float64)

    # Prepare the parameters and their bounds.
    params = Parameters()
    params.add('B0', value=B0_start)
    params.add('E', value=E_start, min=0.00001)
    params.add('E_D', value=E_D_start, min=0.00001)
    params.add('T_pk', value=T_pk_start, min=273.15)

    try:

        # Set the random seed.
        numpy.random.seed(1337)

        # Try and fit!
        minimize(JoLe, params, args=(temps, trait_vals))
    except Exception:

        # If fitting failed, return.
        return None, None, None, None


	# Since we're still here, fitting was successful!
    points_before_pk = 0
    points_after_pk = 0

	# Collect measured trait values without log transformation.
    trait_vals_no_log = []
    for row in dataset:
        trait_vals_no_log.append(float(row[5]))
        
        # Get the number of data points before and after T_pk.
        if float(row[4]) < (params['T_pk'].value - 273.15):
            points_before_pk += 1
        elif float(row[4]) > (params['T_pk'].value - 273.15):
            points_after_pk += 1

    # Calculate the estimated trait values.
    pred = exp(
        1) ** JoLe_eq(temps,
                         params['B0'].value,
                         params['E'].value,
                         params['E_D'].value,
                         params['T_pk'].value)
    pred = numpy.array(pred, dtype=numpy.float64)

    # Calculate the residual sum of squares.
    residuals = trait_vals_no_log - pred
    rss = sum(residuals ** 2)

    # If, for whatever reason, the residual sum of squares is
    # 'not a number' or infinite, then return.
    if numpy.isnan(rss) or numpy.isinf(rss):
        return None, None, None, None

    # Calculate the total sum of squares.
    tss = sum((trait_vals_no_log - numpy.mean(trait_vals_no_log)) ** 2)

    # If the total sum of squares is 0, then we have a perfect fit!
    if tss == 0:
        fit_goodness = 1

    # Otherwise, calculate the R-Squared value.
    else:
        fit_goodness = 1 - (rss / tss)

    # Get the values of the three Information Criteria for this fit.
    AIC_JoLe = AICrss(len(temps), 4, rss)
    BIC_JoLe = BICrss(len(temps), 4, rss)
    HQC_JoLe = HQCrss(len(temps), 4, rss)

    # Create a list of Species, Standardised Species, Reference, Trait,
    # Latitude, Longitude ...
    result_line = [
      dataset[0][0], dataset[0][1], dataset[0][2], dataset[0][3],
      dataset[0][7], dataset[0][8]
    ]

    # Temperatures ...
    temperatures = ""
    for element in temps:
        temperatures += str(element - 273.15) + ','
    temperatures = temperatures[:-1]
    result_line.append(temperatures)

    # Trait Values ...
    trait_values = ""
    for element in trait_vals_no_log:
        trait_values += str(element) + ','
    trait_values = trait_values[:-1]
    result_line.append(trait_values)

    # B0 and B0_stderr ...
    result_line.append(str(params['B0'].value))
    result_line.append(str(params['B0'].stderr))
    
    # E and E_stderr ...
    result_line.append(str(params['E'].value))
    result_line.append(str(params['E'].stderr))

    # T_pk and T_pk_stderr ...
    result_line.append(str(params['T_pk'].value - 273.15))
    result_line.append(str(params['T_pk'].stderr))

    # E_D and E_D_stderr ...
    result_line.append(str(params['E_D'].value))
    result_line.append(str(params['E_D'].stderr))

    # No theta and theta_stderr for this model!
    result_line.append("NA")
    result_line.append("NA")
    
    # R-squared ...
    result_line.append(str(fit_goodness))
    
    # Formula ...
    result_line.append(
       'log(Trait_value) = log(B0 * exp((-E/' + str(K) \
        + ') * ((1/temp) - (1/273.15)))/(1 + exp((1/' + str(K) \
        + ') * (((E_D/T_pk) + ' + str(K) \
        + ' * log(E/(E_D - E))) - (E_D/temp)))))')
    
    # Model name ...
    result_line.append("Johnson - Lewin")
    
    # Implementation ...
    result_line.append("lmfit.minimize (Python package)")
    
    # Number of data points before and after T_pk ...
    result_line.append(str(points_before_pk))
    result_line.append(str(points_after_pk))

    return AIC_JoLe, BIC_JoLe, HQC_JoLe, result_line


def JoLe_eq(temp, B0, E, E_D, T_pk):
    """Johnson - Lewin model, used for estimating trait values at 
    a given temperature."""
    global K

    function = B0 * exp(1) ** (-E / (K * temp)) / (1 + exp(1) ** (1 / K
                  * (E_D / T_pk + K * log(E / (E_D - E)) - (E_D / temp))))
    return numpy.array(map(log, function), dtype=numpy.float64)


def JoLe(params, temp, data):
    """Johnson - Lewin model, used by the optimizer."""

    global K

    # Get the parameters.
    E = params['E'].value
    E_D = params['E_D'].value
    T_pk = params['T_pk'].value
    B0 = params['B0'].value

    # Prevent E being higher than E_D, by punishing the optimizer with huge
    # numbers when that is the case.
    if E >= E_D:
        return 1e10

    # Otherwise, fit the model!
    function = B0 * exp(1) ** (-E / (K * temp)) / (1 + exp(1) ** (1 / K
                  * (E_D / T_pk + K * log(E / (E_D - E)) - (E_D / temp))))

    return numpy.array(map(log, function) - data, dtype=numpy.float64)


def schoolfield_model(dataset, B0_start, E_start, T_pk_start, E_D_start):
    """Prepare the Schoolfield model."""

    global K

    # Store temperatures and log-transformed trait values.
    temps = []
    trait_vals = []

    for row in dataset:

        # Convert temperatures to Kelvin.
        temps.append(float(row[4]) + 273.15)
        trait_vals.append(log(float(row[5])))

    # Convert temps and trait_vals to numpy arrays.
    temps = numpy.array(temps, dtype=numpy.float64)
    trait_vals = numpy.array(trait_vals, dtype=numpy.float64)

    # Prepare the parameters and their bounds.
    params = Parameters()
    params.add('B0', value=B0_start)
    params.add('E', value=E_start, min=0.00001, max=30)
    params.add('E_D', value=E_D_start, min=0.00001, max=50)
    params.add('T_pk', value=T_pk_start, min=273.15, max=273.15 + 150)

    try:

        # Set the random seed.
        numpy.random.seed(1337)

        # Try and fit!
        minimize(schoolf, params, args=(temps, trait_vals))
    except Exception:

        # If fitting failed, return.
        return None, None, None, None

	# Since we're still here, fitting was successful!
    points_before_pk = 0
    points_after_pk = 0

	# Collect measured trait values without log transformation.
    trait_vals_no_log = []
    for row in dataset:
        trait_vals_no_log.append(float(row[5]))
        
        # Get the number of data points before and after T_pk.
        if float(row[4]) < (params['T_pk'].value - 273.15):
            points_before_pk += 1
        elif float(row[4]) > (params['T_pk'].value - 273.15):
            points_after_pk += 1

    # Calculate the estimated trait values.
    pred = exp(
        1) ** schoolf_eq(temps,
                         params['B0'].value,
                         params['E'].value,
                         params['E_D'].value,
                         params['T_pk'].value)
    pred = numpy.array(pred, dtype=numpy.float64)

    # Calculate the residual sum of squares.
    residuals = trait_vals_no_log - pred
    rss = sum(residuals ** 2)

    # If, for whatever reason, the residual sum of squares is
    # 'not a number' or infinite, then return.
    if numpy.isnan(rss) or numpy.isinf(rss):
        return None, None, None, None

    # Calculate the total sum of squares.
    tss = sum((trait_vals_no_log - numpy.mean(trait_vals_no_log)) ** 2)

    # If the total sum of squares is 0, then we have a perfect fit!
    if tss == 0:
        fit_goodness = 1

    # Otherwise, calculate the R-Squared value.
    else:
        fit_goodness = 1 - (rss / tss)

    # Get the values of the three Information Criteria for this fit.
    AIC_schoolfield = AICrss(len(temps), 4, rss)
    BIC_schoolfield = BICrss(len(temps), 4, rss)
    HQC_schoolfield = HQCrss(len(temps), 4, rss)

    # Create a list of Species, Standardised Species, Reference, Trait,
    # Latitude, Longitude ...
    result_line = [
      dataset[0][0], dataset[0][1], dataset[0][2], dataset[0][3],
      dataset[0][7], dataset[0][8]
    ]

    # Temperatures ...
    temperatures = ""
    for element in temps:
        temperatures += str(element - 273.15) + ','
    temperatures = temperatures[:-1]
    result_line.append(temperatures)

    # Trait Values ...
    trait_values = ""
    for element in trait_vals_no_log:
        trait_values += str(element) + ','
    trait_values = trait_values[:-1]
    result_line.append(trait_values)

    # B0 and B0_stderr ...
    result_line.append(str(params['B0'].value))
    result_line.append(str(params['B0'].stderr))
    
    # E and E_stderr ...
    result_line.append(str(params['E'].value))
    result_line.append(str(params['E'].stderr))

    # T_pk and T_pk_stderr ...
    result_line.append(str(params['T_pk'].value - 273.15))
    result_line.append(str(params['T_pk'].stderr))

    # E_D and E_D_stderr ...
    result_line.append(str(params['E_D'].value))
    result_line.append(str(params['E_D'].stderr))

    # No theta and theta_stderr for this model!
    result_line.append("NA")
    result_line.append("NA")
    
    # R-squared ...
    result_line.append(str(fit_goodness))
    
    # Formula ...
    result_line.append(
       "log(Trait_value) = log(B0 * exp(-E * ((1/(" + str(K) \
        + " * temp)) - (1/(" + str(K) \
        + " * 273.15))))/(1 + (E/(E_D - E)) * exp(E_D/" \
        + str(K) + " * (1/T_pk - 1/temp))))")
    
    # Model name ...
    result_line.append("Schoolfield")
    
    # Implementation ...
    result_line.append("lmfit.minimize (Python package)")
    
    # Number of data points before and after T_pk ...
    result_line.append(str(points_before_pk))
    result_line.append(str(points_after_pk))

    return AIC_schoolfield, BIC_schoolfield, HQC_schoolfield, result_line


def schoolf_eq(temp, B0, E, E_D, T_pk):
    """Schoolfield model, used for estimating trait values at 
    a given temperature."""
    global K
    
    function = B0 * exp(1) ** (-E * ((1/(K*temp)) - (1/(K*283.15)))) / (1 + (E/(E_D - E)) * exp(1) ** (E_D / K
            * (1 / T_pk - 1 / temp)))
    return numpy.array(map(log, function), dtype=numpy.float64)


def schoolf(params, temp, data):
    """Schoolfield model, used by the optimizer."""

    global K

    E = params['E'].value
    E_D = params['E_D'].value
    T_pk = params['T_pk'].value
    B0 = params['B0'].value

    if E >= E_D:
        return 1e10

    function = B0 * exp(1) ** (-E * ((1/(K*temp)) - (1/(K*283.15)))) / (1 + (E/(E_D - E)) * exp(1) ** (E_D / K
            * (1 / T_pk - 1 / temp)))
    return numpy.array(map(log, function) - data, dtype=numpy.float64)


############################
# M  A  I  N    C  O  D  E #
############################

def main(argv):
     
    # Define the Boltzmann constant (units of eV * K^-1).
    global K
    K = 8.617 * 10 ** (-5)
    
    # Raise an error if an input dataset wasn't provided.
    if len(sys.argv) != 2:
        sys.exit("USAGE: " + sys.argv[0] + " input_dataset")
    
    # Read the dataset file into a csv object.
    with open(sys.argv[1]) as csvfile:
        csv_dataset = csv.reader(csvfile)
    
        # Store the data in a list.
        original_dataset = [row for row in csv_dataset]
    
    # Create an output CSV file that compares AIC, BIC and HQC for the three
    # models.
    comparison = open(
        "../../../Results/overview/results_Python/results_model_comparison.csv",
        'w')
    comparison_csv = csv.writer(comparison, delimiter="\t")
    comparison_csv.writerow(
        ['Species', 'Reference', 'Trait', 'AIC_GauGo', 'AIC_JoLe', 'AIC_Schoolf',
         'BIC_GauGo', 'BIC_JoLe', 'BIC_Schoolf', 'HQC_GauGo', 'HQC_JoLe',
         'HQC_Schoolf', 'Selected_model'])
    
    # Create an output CSV file with parameters estimates for all the models.
    results = open("../../../Results/overview/results_Python/results.csv", 'w')
    results_csv = csv.writer(results, delimiter="\t")
    results_csv.writerow(
        ['Species_orig', 'Species_stand', 'Reference', 'Trait', 'Latitude',
         'Longitude', 'Temp_Vals', 'Trait_Vals', 'B0', 'B0_stderr', 'E',
         'E_stderr', 'T_pk', 'T_pk_stderr', 'E_D', 'E_D_stderr', 'Theta',
         'Theta_stderr', 'R_Squared', 'Formula', 'Model_name', 
         'NLS_implementation', 'DataPoints_rise', 'DataPoints_fall'])

    # Create unique IDs for the species in the dataset.
    ids = create_ids(original_dataset)
    
    # Create an ordered dictionary object by alphabetically sorting the IDs
    # according to the species name.
    ids = OrderedDict(sorted(ids.items(), key=lambda x: x[0]))
        
    counter = 0
    
    # Iterate over the IDs.
    for entry in ids:

        # Get the useful information for this ID.
        species = ids[entry][0]
        ref = ids[entry][1]
        trait = ids[entry][2]
        lat = ids[entry][3]
        lon = ids[entry][4]
    
        # Get the corresponding subset of the data for this ID.
        specific_data = get_specific_data(
            original_dataset,
            species,
            ref,
            trait,
            lat,
            lon)
    
        # Ignore this ID if less than 5 data points were available.
        if len(specific_data) < 5:
            counter += 1
            print(counter)
            continue
    
        # Obtain starting values for the non-linear least squares model.
        (max_trait, T_pk_start, B0_start, E_start,
         E_D_start) = gen_starting_values(specific_data)
    
        counter += 1
        print(counter)

        # Fit the models!
        GauGo_fit = gaugo_model(specific_data, E_start, T_pk_start,
        		E_D_start)
    
        JoLe_fit = jole_model(specific_data, B0_start, E_start, T_pk_start,
        		E_D_start)
    
        Schoolf_fit = schoolfield_model(specific_data, B0_start, E_start,
        		T_pk_start, E_D_start)
    
        if GauGo_fit[0] is None:
            GauGo_fit = [None, None, None, None]
        else:
			results_csv.writerow(GauGo_fit[3])

        if JoLe_fit[0] is None:
            JoLe_fit = [None, None, None, None]
        else:
			results_csv.writerow(JoLe_fit[3])

        if Schoolf_fit[0] is None:
            Schoolf_fit = [None, None, None, None]
        else:
			results_csv.writerow(Schoolf_fit[3])
    
        # Decide on the best model according to AIC, BIC and HQC.
        AIC_selection = best_model(
            [GauGo_fit[0],
             JoLe_fit[0],
             Schoolf_fit[0],
             12345678909876543210])
        BIC_selection = best_model(
            [GauGo_fit[1],
             JoLe_fit[1],
             Schoolf_fit[1],
             12345678909876543210])
        HQC_selection = best_model(
            [GauGo_fit[2],
             JoLe_fit[2],
             Schoolf_fit[2],
             12345678909876543210])
    
        # Selection counters for Gaussian - Gompertz (1), Johnson - Lewin (2),
        # Schoolfield (3), no model.
        model_1 = 0
        model_2 = 0
        model_3 = 0
        no_model = 0
    
        # Add to the selection counters according to the 3 criteria.
        for crit in [AIC_selection, BIC_selection, HQC_selection]:
            if crit == 1:
                model_1 += 1
            elif crit == 2:
                model_2 += 1
            elif crit == 3:
                model_3 += 1
            elif crit == 0:
                no_model += 1
    
        # Check which model was selected the most.
        if model_1 >= 2:
            selected = 'Gaussian-Gompertz'
    
        elif model_2 >= 2:
            selected = 'Johnson-Lewin'
    
        elif model_3 >= 2:
            selected = 'Schoolfield'
    
        elif no_model != 3:
            continue
            
        comparison_csv.writerow(
        [species, ref, trait, str(GauGo_fit[0]), str(JoLe_fit[0]), 
         str(Schoolf_fit[0]), str(GauGo_fit[1]), str(JoLe_fit[1]), 
         str(Schoolf_fit[1]), str(GauGo_fit[2]), str(JoLe_fit[2]),
         str(Schoolf_fit[2]), selected])

    return 0

if __name__ == "__main__":
	main(sys.argv)
