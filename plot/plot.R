# This script contains the plot that produces Fig 3

#source("analysis/analysis.R")

Fig_3 <- ggplot(data_comb_avgs, x = sample_date) +
  geom_line(aes( x = sample_date, y = ca_avg)) +
  geom_line(aes(x = sample_date, y = k_avg))

Fig_3
