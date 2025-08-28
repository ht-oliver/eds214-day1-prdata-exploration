# This analysis finds the 9-week rolling average of the concentrations of calcium, nitrate, nitrite, magnesium and potassium in 4 different watersheds in PR from 1989-1999.


source("2_data_cleaning/data_clean.R")



data_comb_avgs <- data_combined %>% 
  
  mutate(ca_avg = (sapply(
    data_combined$sample_date,
    roll_avg,
    dates = data_combined$sample_date,
    conc = data_combined$ca,
    win_size_wks = 9
  ))) %>% 
  
  mutate(nh4_n_avg = (sapply(
    data_combined$sample_date,
    roll_avg,
    dates = data_combined$sample_date,
    conc = data_combined$nh4_n,
    win_size_wks = 9
  ))) %>% 
  
  mutate(mg_avg = (sapply(
    data_combined$sample_date,
    roll_avg,
    dates = data_combined$sample_date,
    conc = data_combined$mg,
    win_size_wks = 9
  ))) %>% 
  
  mutate(no3_n_avg = (sapply(
    data_combined$sample_date,
    roll_avg,
    dates = data_combined$sample_date,
    conc = data_combined$no3_n,
    win_size_wks = 9
  ))) %>% 
  
  mutate(k_avg = (sapply(
    data_combined$sample_date,
    roll_avg,
    dates = data_combined$sample_date,
    conc = data_combined$k,
    win_size_wks = 9
  ))) %>% 
  select(sample_date, ca_avg, nh4_n_avg, no3_n_avg, mg_avg, k_avg, site_id)

data_comb_avgs <- data_comb_avgs %>% 
  pivot_longer(cols = c("ca_avg", "nh4_n_avg", "no3_n_avg", "mg_avg", "k_avg"), names_to = "constituent", values_to = "conc")

write_csv(data_comb_avgs, "4_processed_data/rivers_conc_long.csv")



