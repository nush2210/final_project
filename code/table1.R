library(tidyverse)
library(here)

race_col <- "race_ethnicity"
year_col <- "year"
rate_col <- "age_adjusted_rate"
cases_col <- "cases"

seer <- readr::read_csv(here::here("data", "seer_data.csv"), show_col_types = FALSE)

table1 <- seer %>%
  group_by(race = .data[[race_col]]) %>%
  summarise(
    total_cases = sum(.data[[cases_col]], na.rm = TRUE),
    mean_rate_per_100k = mean(.data[[rate_col]], na.rm = TRUE),
    .groups = "drop"
  ) %>%
  arrange(desc(mean_rate_per_100k))

readr::write_csv(table1, here::here("output", "table1.csv"))
