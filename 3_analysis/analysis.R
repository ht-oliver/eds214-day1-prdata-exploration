# This analysis finds the 9-week rolling average of the concentrations of calcium, nitrate, nitrite, magnesium and potassium in 4 different watersheds in PR from 1989-1999.


# source("2_data_cleaning/data_clean.R")



data_comb_avgs <- data_combined %>% 
  # Each mutate command appends the a new dataframe with a new column that contains the 9-week rolling average of the concentration of a given constituent. 
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
  
  # The select command eliminates the original readings of each constituent so that the final dataframe, which will be used in the plot, only shows the rolling average.
  select(sample_date, ca_avg, nh4_n_avg, no3_n_avg, mg_avg, k_avg, site_id)

# This command transforms the data so that the columns for individual constituents are elminated, and their data are entered into a single column named "constituent"
data_comb_avgs <- data_comb_avgs %>% 
  pivot_longer(cols = c("ca_avg", "nh4_n_avg", "no3_n_avg", "mg_avg", "k_avg"), names_to = "constituent", values_to = "conc")


# Save the final output table to the "4_processed_data" folder
write_csv(data_comb_avgs, "../4_processed_data/data_comb_avgs.csv")



