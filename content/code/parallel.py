import pprocess
import scipy.stats as st
import time
import numpy

def pointless_function(x):
    rv = st.norm.rvs(loc=x, scale=1, size=2e8)
    m = numpy.mean(rv)
    return m

if __name__ == "__main__":
    list_of_args = [1, 3, 10]

    # Serial computation:
    start = time.time()
    serial = map(pointless_function, list_of_args)
    # Print results.
    for i in serial:
        print i
    print "%f s for serial computation." % (time.time() - start)

    # Parallel computation:
    start = time.time()
    nproc = 3  # maximum number of simultaneous processes desired
    parallel = pprocess.pmap(pointless_function, list_of_args, limit=nproc)
    # Print results.
    for i in parallel:
        print i
    print "%f s for parallel computation." % (time.time() - start)
