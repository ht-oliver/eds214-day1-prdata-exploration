# This script contains the plot that produces Fig 3

source("analysis/analysis.R")

ggplot(data_comb_avgs, x = sample_date) +
  geom_line(aes( x = sample_date, y = ca_avg)) +
  geom_line(aes(x = sample_date, y = k_avg)) +
  geom_line(aes(x = sample_date, y = mg_avg)) +
  geom_line(aes(x = sample_date, y = no3_n_avg)) +
  geom_line(aes(x = sample_date, y = nh4_n_avg))