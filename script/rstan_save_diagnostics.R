library(pacman)
p_load(rstan)
p_load(ggmcmc)

load("output/result-model4-5.RData")

frame_saved <- as_tibble(summary(fit)$summary) %>%
  mutate(variable = row.names(summary(fit)$summary)) %>%
  relocate(variable, before = 1)

write_excel_csv(frame_saved, "output/fit_summary.csv")

ggmcmc(
  ggs(fit, inc_warmup = TRUE, stan_include_auxiliar = TRUE,),
  file = "output/fit_tracplot.pdf", plot = "traceplot"
)
