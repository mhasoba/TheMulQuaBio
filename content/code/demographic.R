# CMEE 2024 HPC exercises R code provided
# Stochastic and deterministic demographic model

deterministic_step <- function(state,projection_matrix){
  new_state = projection_matrix %*% state
  return(new_state)
}

deterministic_simulation <- function(initial_state,projection_matrix,simulation_length){
  population_size <- numeric(simulation_length + 1) # list as long as sim length + 1
  population_size[1] <- sum(initial_state) # first value = sum initial state
  for (i in 1:simulation_length) {
    initial_state <- deterministic_step(initial_state, projection_matrix) # step through
    population_size[i + 1] <- sum(initial_state) # add to index
  }
  return(population_size)
}

multinomial <- function(pool, probs) {
  if (sum(probs) > 1) { # check probability
    print("Sum of probabilities is greater than 1")
  }
  death = 1 - sum(probs) # death prob
  probd = c(probs, death) # merge them
  x = as.vector(rmultinom(n=11, pool, probd)) # sample
  return(x[1:length(probs)])
}

survival_maturation <- function(state,growth_matrix){
  new_state <- rep(0, length(state)) # 1. new population state
  for (i in 1:length(state)){
    current_individuals <- state[i] # 2.1 individuals in life stage i
    transition_probs <- growth_matrix[,i] # 2.2 initialise probabilities from matrix
    individuals_count <- multinomial(current_individuals, transition_probs) # 2.2 individuals that remain in stage i
    new_state <- sum_vect(new_state, individuals_count)
  }
  return(new_state) # 3. return new_state
}

random_draw <- function(probability_distribution) {
  draw <- sample(1:length(probability_distribution), size = 1, prob = probability_distribution, replace = TrUE)
  return(draw)
}

stochastic_recruitment <- function(reproduction_matrix,clutch_distribution){
  recruitment_rate <- reproduction_matrix[1, ncol(reproduction_matrix)] # get recruitment rate
  expected_clutch_size <- sum(clutch_distribution * (1:length(clutch_distribution))) # get mean clutch size
  recruitment_probability <- recruitment_rate / expected_clutch_size # recruitment probability
  if (recruitment_probability > 1) { # check probability
    stop("Inconsistency in model parameters: recruitment probability cannot exceed 1.")
  }
  return(recruitment_probability)
}

offspring_calc <- function(state, clutch_distribution, recruitment_probability) {
  offspring = 0
  x = state[length(state)] # number of adults
  number_clutch = rbinom(1, x, recruitment_probability) # number of recruiting adults

  if (number_clutch > 0) { # check for population collapse
    for (i in 1:number_clutch) {
      clutch = random_draw(clutch_distribution) # get clutch size
      offspring = offspring + clutch # sum number of offspring
    }
  }

  return(offspring) # total number of offspring
}

stochastic_step <- function(state,growth_matrix,reproduction_matrix,clutch_distribution,recruitment_probability){
  new_state = survival_maturation(state, growth_matrix) # survival and maturation
  total_offspring = offspring_calc(state, clutch_distribution, recruitment_probability) # number of offspring produced
  new_state[1] = new_state[1] + total_offspring # add to new state
  return(new_state)
}

stochastic_simulation <- function(initial_state,growth_matrix,reproduction_matrix,clutch_distribution,simulation_length){
  population_size <- numeric(simulation_length + 1) # population of length sim + 1
  population_size[1] = sum(initial_state) # first value sum of initial state
  recruitment_probability = stochastic_recruitment(reproduction_matrix, clutch_distribution) # recruitment probability

  for(i in 1:simulation_length){
    new_state = stochastic_step(initial_state, growth_matrix, reproduction_matrix, clutch_distribution, recruitment_probability) # one step of stochastic model
    population_size[i + 1] = sum(new_state) # update population time series
    if (sum(new_state) == 0){break} # stop if the population is zero
    initial_state = new_state # update for next iter
  }

  if (length(population_size) < simulation_length + 1){ # fill remaining entries with 0
    population_size[(length(population_size) + 1):(simulation_length + 1)]
  }

  return(population_size)
}

