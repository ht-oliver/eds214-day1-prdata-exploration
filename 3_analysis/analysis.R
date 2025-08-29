# This analysis finds the 9-week rolling average of the concentrations of calcium, nitrate, nitrite, magnesium and potassium in 4 different watersheds in PR from 1989-1999.

# Each mutate command below appends a new data frame with an additional column that contains the 9-week rolling average of the concentration of a given constituent. 

source("../R/roll_avg.R") # rolling average function


data_comb_avgs <- data_combined %>% 
  
  group_by(site_id) %>% 
  
  mutate(ca_avg = (sapply(
    sample_date,
    roll_avg,
    dates = sample_date,
    conc = ca,
    win_size_wks = 9
  ))) %>% 
  
  mutate(nh4_n_avg = (sapply(
    sample_date,
    roll_avg,
    dates = sample_date,
    conc = nh4_n,
    win_size_wks = 9
  ))) %>% 
  
  mutate(mg_avg = (sapply(
    sample_date,
    roll_avg,
    dates = sample_date,
    conc = mg,
    win_size_wks = 9
  ))) %>% 
  
  mutate(no3_n_avg = (sapply(
    sample_date,
    roll_avg,
    dates = sample_date,
    conc = no3_n,
    win_size_wks = 9
  ))) %>% 
  
  mutate(k_avg = (sapply(
    sample_date,
    roll_avg,
    dates = sample_date,
    conc = k,
    win_size_wks = 9
  ))) %>% 
  
  # The select command eliminates the original readings of each constituent so that the final dataf rame, which will be used in the plot, only shows the rolling average values.
  select(sample_date, ca_avg, nh4_n_avg, no3_n_avg, mg_avg, k_avg, site_id) 

# This command transforms the data so that the columns for individual constituents are eliminated, and their data are entered into a single column named "constituent"
data_comb_avgs <- data_comb_avgs %>% 
  pivot_longer(cols = c("ca_avg", "nh4_n_avg", "no3_n_avg", "mg_avg", "k_avg"), names_to = "constituent", values_to = "conc")


# Save the final output table to the "4_processed_data" folder
write_csv(data_comb_avgs, "../4_processed_data/data_comb_avgs.csv")



