#include <stdio.h>
#include <stdlib.h>

int count_primes_C(int limit)
{
    // standard C data types
    int n_primes = 0;
    int prime = 1; // the numbers to test
    int divisor = 2; // the divisor number
    int is_prime = 0; // if 0 it's not a prime, if 1 it's a prime

    while (prime < limit)
    {
        is_prime = 0; // Set the condition to 0 (not prime)

        for(divisor = 2; divisor <= prime/2; ++divisor) // check the values
                                                        // between 2 and the
                                                        // prime number
        {
            if(prime % divisor == 0) // if the prime number can be divided only
                                     // by itself, it's a prime number
            {
                is_prime = 1;  // Set the condition to 1 (is prime)
                break;
            }
        }

        if (is_prime == 0) {
           ++n_primes ;  // increment prime number counter
        }

        ++prime; // increment number counter
    }

    return n_primes;
}

int main(int argc, char *argv[])
{
    int limit;

    limit = atoi(argv[1]);
    printf("%i\n", count_primes_C(limit));
}
