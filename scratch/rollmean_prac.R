library(tidyverse)
library(here)
library(dplyr)
library(zoo)
library(janitor)
library(lubridate)

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
mutate(sample_date = ymd(sample_date))





roll_avg <- function(focal_date, dates, concs, win_size_wks) {
  # Which dates are in the window. Converting wks to days
  is_in_window <- (dates > ((focal_date) - (win_size_wks / 2) * 7)) &
                     (dates < (focal_date + (win_size_wks / 2) * 7))
  # Find the associated concentrations
  window_concs <- concs[is_in_window]
  # calculate the mean
  result <- mean(window_concs)
  
  return(result)
}

ca_ma_1990_04_05 <- roll_avg(focal_date = as.Date("1990-04-05"),
                             dates = data_combined$sample_date,
                             conc = data_combined$ca,
                             win_size_wks = 9)


# Did it work?  

# Apply the function

# Max wnats to use sapply()


data_combined$calc_rolling <- sapply(
  data_combined$sample_date,
  roll_avg,
  dates = data_combined$sample_date,
  conc = data_combined$ca,
  win_size_wks = 9
)


ca_avg <- sapply(
  data_combined$sample_date,
  roll_avg,
  dates = data_combined$sample_date,
  conc = data_combined$ca,
  win_size_wks = 9
)


k_avg <- sapply(
  data_combined$sample_date,
  roll_avg,
  dates = data_combined$sample_date,
  conc = data_combined$k,
  win_size_wks = 9
)


nh4_n_avg <- sapply(
  data_combined$sample_date,
  roll_avg,
  dates = data_combined$sample_date,
  conc = data_combined$nh4_n,
  win_size_wks = 9
)


mg_avg <- sapply(
  data_combined$sample_date,
  roll_avg,
  dates = data_combined$sample_date,
  conc = data_combined$mg,
  win_size_wks = 9
)


nh3_n_avg <- sapply(
  data_combined$sample_date,
  roll_avg,
  dates = data_combined$sample_date,
  conc = data_combined$nh3_n,
  win_size_wks = 9
)

nh4_n_avg



