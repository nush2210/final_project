library(tidyverse)
library(here)

race_col <- "Race/Ethnicity"
year_col <- "Year"
rate_col <- "Age-adjusted Rate"

seer <- readr::read_csv(here::here("data", "seer_data.csv"), show_col_types = FALSE)

p <- ggplot(
  seer,
  aes(x = .data[[year_col]], y = .data[[rate_col]], color = .data[[race_col]])
) +
  geom_line(linewidth = 1) +
  labs(
    title = "Age-adjusted ovarian cancer incidence by race/ethnicity (SEER)",
    x = "Year of diagnosis",
    y = "Rate per 100,000",
    color = "Race/Ethnicity"
  ) +
  theme_minimal()

ggsave(here::here("output", "figure1.png"), p, width = 7, height = 4.5, dpi = 300)
