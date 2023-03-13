library(pacman)
p_load(rstan)
p_load(tidyverse)
p_load(rstudioapi)
p_load(ggmcmc)

#d <- read_csv("../input/data-salary.txt")
d <- read_csv("input/data-salary.txt")

data <- list(
  N = nrow(d),
  X = d$X,
  Y = d$Y
)

#fit <- stan(file = "../stan/model4-5.stan", data = data, seed = 1234)
fit <- stan(file = "stan/model4-5.stan", data = data, seed = 1234)

save.image(file = "output/result-model4-5.RData")

#stan_model(file = "stan/model4-5.stan")
fit

ms <- rstan::extract(fit)
ms$b
