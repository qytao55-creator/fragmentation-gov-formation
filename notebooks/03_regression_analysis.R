# 03_regression_analysis.R
# Goal: Regression analysis of fragmentation on government formation duration

library(tidyverse)
library(fixest)

# ---- Load data ----
main_data <- read.csv("data/processed/main_data.csv")
main_data$election_date <- as.Date(main_data$election_date)

reg_data <- main_data %>%
  filter(!is.na(log_days) & !is.na(enp) & !is.na(largest_party_share))

# ---- Main models ----
m1 <- feols(log_days ~ enp, data = reg_data)
m2 <- feols(log_days ~ enp + largest_party_share + year, data = reg_data)
m3 <- feols(log_days ~ enp + largest_party_share + year | country, data = reg_data)

etable(m1, m2, m3)

# ---- Robustness checks ----
m4 <- feols(days_to_form ~ enp + largest_party_share + year | country, 
            data = reg_data)

pm_info <- cabinet %>%
  filter(prime_minister == 1 & caretaker == 0) %>%
  group_by(election_id) %>%
  slice(1) %>%
  select(election_id, pm_party_id = party_id)

party_ranks <- election %>%
  filter(!is.na(seats)) %>%
  group_by(election_id) %>%
  mutate(seat_rank = rank(-seats, ties.method = "min")) %>%
  select(election_id, party_id, seat_rank)

pm_rank <- pm_info %>%
  left_join(party_ranks, by = c("election_id", "pm_party_id" = "party_id"))

reg_data <- reg_data %>%
  left_join(pm_rank %>% select(election_id, pm_seat_rank = seat_rank), 
            by = "election_id")

m5 <- feols(pm_seat_rank ~ enp + largest_party_share + year | country,
            data = reg_data %>% filter(!is.na(pm_seat_rank)))

# ---- Clustered standard errors (main reporting version) ----
m3_cl <- feols(log_days ~ enp + largest_party_share + year | country, 
               data = reg_data, cluster = ~country)

m4_cl <- feols(days_to_form ~ enp + largest_party_share + year | country, 
               data = reg_data, cluster = ~country)

m5_cl <- feols(pm_seat_rank ~ enp + largest_party_share + year | country,
               data = reg_data %>% filter(!is.na(pm_seat_rank)),
               cluster = ~country)

etable(m3_cl, m4_cl, m5_cl)
