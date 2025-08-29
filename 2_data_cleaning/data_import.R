# Import raw data from data folder. Add a column to each import that identifies the site ID.

library(tidyverse)
library(here)

prm <- as.data.frame(read_csv(here("data/knb-lter-luq/RioMameyesPuenteRoto.csv"), na = "NA")) %>% 
  mutate(site_id = "PRM")
bq1 <- as.data.frame(read_csv(here("data/knb-lter-luq/QuebradaCuenca1-Bisley.csv"), na = "NA")) %>% 
  mutate(site_id = "BQ1")
bq2 <- as.data.frame(read_csv(here("data/knb-lter-luq/QuebradaCuenca2-Bisley.csv"), na = "NA")) %>% 
  mutate(site_id = "BQ2")
bq3 <- as.data.frame(read_csv(here("data/knb-lter-luq/QuebradaCuenca3-Bisley.csv"), na = "NA")) %>% 
  mutate(site_id = "BQ3")
