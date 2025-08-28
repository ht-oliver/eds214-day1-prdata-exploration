library(tidyverse)
library(here)
library(dplyr)

library(janitor)
library(lubridate)


# REVISED WORKFLOW
# Read in all data, clean as you read it in to only include our five constituents.
# Append each table with a column for site name (PRM, BQ1, BQ2, BQ3)
# Combine all data tables to data_combined



prm <- as.data.frame(read_csv(here("data/knb-lter-luq/RioMameyesPuenteRoto.csv"))) %>% 
  clean_names() %>% select("sample_date", "ca", "nh4_n", "mg", "no3_n", "k") %>% 
  mutate(site_id = "PRM")
 
bq1 <- as.data.frame(read_csv(here("data/knb-lter-luq/QuebradaCuenca1-Bisley.csv"))) %>% 
  clean_names() %>% select("sample_date", "ca", "nh4_n", "mg", "no3_n", "k") %>% 
  mutate(site_id = "QC1")

bq2 <- as.data.frame(read_csv(here("data/knb-lter-luq/QuebradaCuenca2-Bisley.csv"))) %>% 
  clean_names() %>% select("sample_date", "ca", "nh4_n", "mg", "no3_n", "k") %>% 
  mutate(site_id = "QC2")

bq3 <- as.data.frame(read_csv(here("data/knb-lter-luq/QuebradaCuenca3-Bisley.csv"))) %>% 
  clean_names() %>% select("sample_date", "ca", "nh4_n", "mg", "no3_n", "k") %>% 
  mutate(site_id = "QC3")

data_combined <- rbind(prm, bq1, bq2, bq3) %>% 
  mutate(sample_date = ymd(sample_date)) %>% 
  mutate(nh4_n = as.numeric(nh4_n)) %>% 
  mutate(no3_n = as.numeric(no3_n))


source("R/roll_mean.R")

ca_avg <- sapply(
  data_combined$sample_date,
  roll_avg,
  dates = data_combined$sample_date,
  conc = data_combined$ca,
  win_size_wks = 9
)










  