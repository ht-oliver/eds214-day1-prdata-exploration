library(here)
library(tidyverse)
library(janitor)

#The potential workflow for the production of Figure 2 in Schaeffer et. al. 2002
# Load in data from each location, samples were taken weekly on different dates at each site.
# Clean the data so we only have necessary constituents, and the date of the sample taken.
# Mutate the data to add 5 columns to each table, each column should show the 9-week moving average for each constituent Meaning this column will have 1/9th the data as it's respective constituent columns.
# Combine the data into a final table that only has 9-week time steps, and averaged results for each constituent at each sample site.
# GGplot, group by constituent, create a new graph for each constituent 


# REVISED WORKFLOW
# Read in all data, clean as you read it in to only include our five constituents.
# Append each table with a column for site name (PRM, BQ1, BQ2, BQ3)
# Combine all data tables to i


PRM <- as.data.frame(read_csv(here("data/knb-lter-luq/RioMameyesPuenteRoto.csv"))) %>% 
  clean_names() %>% select("sample_date", "ca", "nh4_n", "mg", "no3_n", "k") %>% 
  mutate(site_id = "PRM")
 
BQ1 <- as.data.frame(read_csv(here("data/knb-lter-luq/QuebradaCuenca1-Bisley.csv"))) %>% 
  clean_names() %>% select("sample_date", "ca", "nh4_n", "mg", "no3_n", "k") %>% 
  mutate(site_id = "QC1")

BQ2 <- as.data.frame(read_csv(here("data/knb-lter-luq/QuebradaCuenca2-Bisley.csv"))) %>% 
  clean_names() %>% select("sample_date", "ca", "nh4_n", "mg", "no3_n", "k") %>% 
  mutate(site_id = "QC2")

BQ3 <- as.data.frame(read_csv(here("data/knb-lter-luq/QuebradaCuenca3-Bisley.csv"))) %>% 
  clean_names() %>% select("sample_date", "ca", "nh4_n", "mg", "no3_n", "k") %>% 
  mutate(site_id = "QC3")



  