# Some exercises illustrating control flow

for(counter in 1:10)
{
  print("Hello world!")
}

for(counter in 2:6)
{
  print("I like R!")
}

for(counter in 1:10)
{
  print("Hello world!")
  print(counter)
}

for(year in 2009:2001)
{
  print(paste('The year is', year))
}

for(species in c('Heliodoxa rubinoides', 
                 'Boissonneaua jardini', 
                 'Sula nebouxii'))
{
  print(paste('The species is', species))
}

for(l in LETTERS)
{
  print(l)
}

ten.factorial <- 1
for(counter in 1:10)
{
  ten.factorial <- ten.factorial * counter
  print(ten.factorial)
}
ten.factorial

