library(pacman)
p_load(rstan)
p_load(tidyverse)

d <- read_csv("input/data-salary.txt")

data <- list(N = nrow(d), X = d$X, Y = d$Y)

# Stanファイルのコンパイルのみを行う
stanmodel <- stan_model(file = "stan/model4-5.stan")

# サンプリングのみを行う
fit <- sampling(
  stanmodel,
  data = data,
  pars = c("b", "sigma"),
  init = function() {
    list(
      a = runif(1, -10, 10), # 一様分布だっけ
      b = runif(1, 0, 10),
      sigma = 10
    )
  },
  seed = 123,
  chains = 3,
  iter = 1000,
  warmup = 200, 
  thin = 2
)

fit
