# 01_data_preparation.R
# Goal: Load ParlGov data, filter to target countries, construct main variables

library(tidyverse)

# ---- 1. Load raw data ----
election <- read.csv("data/raw/parlgov_election.csv")
cabinet <- read.csv("data/raw/parlgov_cabinet.csv")

# ---- 2. Filter to target countries and post-1970 ----
target_countries <- c("SWE", "DNK", "NOR", "FIN", "ISL",
                      "DEU", "NLD", "BEL ", "AUT", "IRL",
                      "ITA", "ESP", "PRT", "GRC")

election <- election[election$country_name_short %in% target_countries &
                       election$election_date >= "1970-01-01", ]

cabinet <- cabinet[cabinet$country_name_short %in% target_countries &  
                     cabinet$election_date >= "1970-01-01", ]

# ---- 3. Fix date formats ----
cabinet$start_date <- as.Date(cabinet$start_date)
cabinet$election_date <- as.Date(cabinet$election_date)
election$election_date <- as.Date(election$election_date)

# ---- 4. Construct days_to_form_government ----
gov_dates <- cabinet %>%
  filter(caretaker == 0) %>%
  group_by(election_id) %>%
  summarise(gov_start = min(start_date),
            election_date_cab = min(election_date))

gov_dates <- gov_dates %>%
  mutate(days_to_form = as.numeric(gov_start - election_date_cab))

# ---- 5. Construct ENP and largest party share ----
enp <- election %>%
  filter(!is.na(seats) & seats_total > 0) %>%
  group_by(election_id) %>%
  summarise(
    enp = 1 / sum((seats / seats_total)^2, na.rm = TRUE),
    largest_party_share = max(seats / seats_total, na.rm = TRUE),
    election_date = min(election_date),
    country = first(country_name_short)
  )

# ---- 6. Join and construct final variables ----
main_data <- enp %>%
  left_join(gov_dates, by = "election_id") %>%
  mutate(
    log_days = log(days_to_form + 1),
    year = as.numeric(format(election_date, "%Y"))
  )

# ---- 7. Save processed data ----
write.csv(main_data, "data/processed/main_data.csv", row.names = FALSE)

cat("Done. Total elections:", nrow(main_data), "\n")
cat("Valid observations (non-NA):", sum(!is.na(main_data$days_to_form)), "\n")
