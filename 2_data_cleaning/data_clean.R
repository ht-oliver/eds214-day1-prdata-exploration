# Combine raw data imports into a single dataframe. Select for desired columns, change column classes.

# source("1_env_init/environment_init.R")



data_combined <- rbind(prm, bq1, bq2, bq3) %>% 
  clean_names() %>% 
  select("sample_date", "ca", "nh4_n", "mg", "no3_n", "k", "site_id") %>% 
  mutate(sample_date = ymd(sample_date)) %>% # change date format for function
  filter(sample_date < "1995-01-01") %>% # omit dates before January 1, 2000
  mutate(nh4_n = as.numeric(nh4_n)) %>% # make nh4_n and no3_n records numeric
  mutate(no3_n = as.numeric(no3_n)) 
