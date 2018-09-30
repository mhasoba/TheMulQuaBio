require(ggplot2)
require(reshape)

GenerateMatrix <- function(N){
  M <- matrix(runif(N * N), N, N)
  return(M)
}

M <- GenerateMatrix(10)

Melt <- melt(M)

p <- ggplot(Melt, aes(X1, X2, fill = value))
p <- p + geom_tile(colour = "black")
p <- p + opts(legend.position = "none", 
     panel.background = theme_blank(),
     axis.ticks = theme_blank(), 
     panel.grid.major=theme_blank(),
     panel.grid.minor=theme_blank(),
     axis.text.x = theme_blank(),
     axis.title.x=theme_blank(),
     axis.text.y = theme_blank(),
     axis.title.y=theme_blank())
     
p <- p + scale_fill_gradientn(colours = c("red", "white", "blue"))
