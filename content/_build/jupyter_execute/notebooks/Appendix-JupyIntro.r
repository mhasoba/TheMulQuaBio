a = "this is python!"; print(a)

a <- "this is R!"; cat(a)

import matplotlib.pyplot as p
import scipy as sc

x = sc.arange(0, 5, 0.1); y = sc.sin(x)
p.plot(x, y); p.show()

require(ggplot2)
library(repr)# to resize plot within jupyter - this package is part of IRKernel
options(repr.plot.width=3.3,repr.plot.height=2.5)

x <- seq(0, 5, 0.1); y <- sin(x)
qplot(x, y, geom = "line") # large figure
