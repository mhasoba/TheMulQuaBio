## Function for counting the prime numbers between 1 and the given limit
count.primes.R <- function(limit) {
    prime = 1
    n_prime = 2 # Counting 2 as the first prime

    while (prime < limit)
    {
        is_prime = 0

        for(divisor in 2:(prime/2))
        {
            if(prime %% divisor == 0)
            {
                is_prime = 1
                break
            }
        }

        if (is_prime == 0) {
            n_prime <- n_prime + 1
        }

        prime <- prime + 1
    }

    return(n_prime)
}