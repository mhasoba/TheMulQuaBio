DATA FROM
Goldberg EE, Kohn JR, Lande R, Robertson KA, Smith SA, Igic B (2010) Species selection maintains self-incompatibility. Science 330(6003): 493-495. doi:10.1126/science.1194513

DOWNLOADED FROM
http://datadryad.org/resource/doi:10.5061/dryad.1888


For macroevolutionary models of binary character evolution to be applied to breeding system evolution, each species must be classified as either SI or SC, and this can be difficult. We use the same general principles as described elsewhere (Igic et al. 2006; PNAS 103:1359-1363). 

The best available data, however sparse, indicate that the breakdown of SI is so common that no SI species studied in any detail fails to reveal segregating SC mutants, SC populations, or sister species. Our intention is to measure the average rate at which an entire lineage, ancestrally SI (see main text and Igic et al. 2008), transitions to SC. Therefore, we encode as SI all "polymorphic" taxa that have not entirely transitioned to SI. This encoding should yield a conservative estimate of the advantage of SI lineages. The breeding system data were available for 356 species, also represented on the phylogeny of "x=12" Solanaceae. Of those, 116 were described in the literature as SI, 196 as SC, 17 as both SI and SC, 25 as dioecious, and one each as SI/SC/dioecious and SI/dioecious.

For transparency and user convenience, the file contains original encoding as follows:

 0:   SI
 1:   SC
 2:   SI+SC (does not distinguish whether any pops are fixed or not)
 3:   SI+SC+Dioecy (only Lycium_californicum)
 4:   Dioecy
 5:   SI+Dioecy (only Solanum_wendlandii)

The analyses were performed on the following combining scheme:

 0: any SI (0,2,3,5 above)
 1: no SI (1,4 above)
