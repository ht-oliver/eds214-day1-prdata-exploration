#The potential workflow for the production of Figure 2 in Schaeffer et. al. 2002
# Load in data from each location, samples were taken weekly on different dates at each site.
# Clean the data so we only have necessary constituents, and the date of the sample taken.
# Mutate the data to add 5 columns to each table, each column should show the 9-week moving average for each constituent Meaning this column will have 1/9th the data as it's respective constituent columns.
# Combine the data into a final table that only has 9-week time steps, and averaged results for each constituent at each sample site.
# GGplot, group by constituent, create a new graph for each constituent 

library(tidyverse)
library(here)
library(dplyr)
library(zoo)
library(janitor)

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


prm_avgs <- prm %>% 
  mutate(roll_avg = seq_along(prm$sample_date))

# I want to make a new column that has the average for the last nine days in a new column - this wont be perfect but it will be something. Getting a rolling average is hard.

#Create an empty vector and try to develop a column with averages -failure

vector <- seq(1:20)
as.data.frame(vector)

for (i in vector) print(2)

col2 <- for (i in vector) print (((i-1) + (i) + (i+1))/3)

col2

# combine watershed data
data_combined = rbind(prm, bq1, bq2, bq3)

data_combined %>% 
  mutate(ca_mean = rollmeanr(data_combined$ca, k = 9))


data_combined %>%
  mutate(ca_mean = rollmean(data_combined$ca, 9, fill = NA ))
  


# value = new column at position n = the sum of position n-4:n+4 in old column

data_combined <- data_combined %>% 
  mutate(ca2 = mean(data_combined$ca[1:5]))

ca_avg[3] = mean(ca[1:5])
ca_avg[6] = mean(ca[4:8])
ca_avg[9] = mean(ca[7:11])
ca_avg[n] = mean(ca[n-2:n+2])


roll_avg <- c(sum((data_combined$ca[1:9])/9), sum((data_combined$ca[10:18])/9))


roll_mean <- data_combined$ca %>% 
  c((sum[1:9]), (sum[10:18]), (sum[19:27]))

data_combined %>% 
  mutate(new_var = sum($ca[n:n+9]))



for (i in data_combined$ca) {
  print (sum(data_combined$ca[(i-3):(i+3)])/7)
}


averages <- data_combined %>% 
  mutate(avg_ca = rollmean(ca, k = 9, fill = NA, align = 'left')) %>% 
  mutate(avg_nh4_n = rollmean(nh4_n, k = 9, fill = NA, align = 'left'))%>% 
  mutate(avg_mg = rollmean(mg, k = 9, fill = NA, align = 'left'))%>% 
  mutate(avg_no3_n = rollmean(no3_n, k = 9, fill = NA, align = 'left'))%>% 
  mutate(avg_k = rollmean(k, k = 9, fill = NA, align = 'left'))

ggplot(averages, aes (x = sample_date)) +
  geom_line( aes(y = avg_ca, x = sample_date, colour = "blue")) +
  geom_line( aes(y = avg_nh4_n, x = sample_date, colour = 'red')) +
  geom_line( aes(y = avg_mg, x = sample_date, colour = 'orange'))


long_combined <-
  data_combined %>% 
  pivot_longer(cols = c("ca", "nh4_n", "no3_n", "mg"), names_to = "constituent", values_to = "concentration") %>% select(-k)



