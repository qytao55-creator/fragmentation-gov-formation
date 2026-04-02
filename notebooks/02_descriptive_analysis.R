# 02_descriptive_analysis.R
# Goal: Descriptive analysis and core figures

library(tidyverse)

# ---- Load data ----
main_data <- read.csv("data/processed/main_data.csv")
main_data$election_date <- as.Date(main_data$election_date)

# ---- Figure 1: ENP trend over time ----
fig1 <- main_data %>%
  filter(!is.na(enp)) %>%
  ggplot(aes(x = year, y = enp)) +
  geom_point(size = 1.2, alpha = 0.6, color = "steelblue") +
  geom_smooth(method = "loess", color = "black", linewidth = 0.8, se = FALSE) +
  facet_wrap(~ country, ncol = 5) +
  labs(
    title = "Party System Fragmentation over Time",
    subtitle = "14 European parliamentary democracies, 1970-2024",
    x = "Year",
    y = "ENP"
  ) +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

fig1
ggsave("figures/fig1_enp_trend.png", fig1, width = 14, height = 8, dpi = 300)

# ---- Figure 2: Formation duration distribution ----
fig2 <- main_data %>%
  filter(!is.na(days_to_form)) %>%
  ggplot(aes(x = days_to_form)) +
  geom_histogram(binwidth = 15, fill = "steelblue", color = "white", alpha = 0.8) +
  geom_vline(xintercept = median(main_data$days_to_form, na.rm = TRUE),
             color = "red", linetype = "dashed", linewidth = 1) +
  annotate("text",
           x = median(main_data$days_to_form, na.rm = TRUE) + 20,
           y = 35,
           label = paste("Median =", median(main_data$days_to_form, na.rm = TRUE), "days"),
           color = "red") +
  labs(
    title = "Distribution of Government Formation Duration",
    subtitle = "14 European parliamentary democracies, 1970-2024",
    x = "Days to Form Government",
    y = "Count"
  ) +
  theme_minimal()
fig2
ggsave("figures/fig2_formation_distribution.png", fig2, width = 8, height = 5, dpi = 300)

# ---- Figure 3: ENP vs formation time ----
fig3 <- main_data %>%
  filter(!is.na(days_to_form) & !is.na(enp)) %>%
  ggplot(aes(x = enp, y = log_days)) +
  geom_point(aes(color = country), alpha = 0.6, size = 2) +
  geom_smooth(method = "lm", color = "black", linewidth = 1.2, se = TRUE) +
  labs(
    title = "Party Fragmentation and Government Formation Duration",
    subtitle = "14 European parliamentary democracies, 1970-2024",
    x = "Effective Number of Parties (ENP)",
    y = "Log(Days to Form Government + 1)",
    color = "Country"
  ) +
  theme_minimal()
fig3
ggsave("figures/fig3_enp_vs_formation.png", fig3, width = 10, height = 6, dpi = 300)

# ---- Figure 4: Country comparison ----
fig4 <- main_data %>%
  filter(!is.na(days_to_form)) %>%
  mutate(country = reorder(country, days_to_form, median)) %>%
  ggplot(aes(x = country, y = days_to_form)) +
  geom_boxplot(aes(fill = country), alpha = 0.7, outlier.shape = 16) +
  geom_text(data = main_data %>% filter(days_to_form > 400),
            aes(label = paste0("BEL ", year, "\n(", days_to_form, " days)")),
            hjust = -0.1, size = 3, color = "darkred") +
  coord_flip() +
  labs(
    title = "Government Formation Duration by Country",
    subtitle = "14 European parliamentary democracies, 1970-2024",
    x = NULL,
    y = "Days to Form Government"
  ) +
  theme_minimal() +
  theme(legend.position = "none")
 
fig4
ggsave("figures/fig4_country_comparison.png", fig4, width = 8, height = 6, dpi = 300)


cat("Figures saved to figures/\n")
# ---- Figure 5: Coefficient plot ----
library(fixest)

# 重新载入模型（如果环境里没有的话）
main_data <- read.csv("data/processed/main_data.csv")
reg_data <- main_data %>%
  filter(!is.na(log_days) & !is.na(enp) & !is.na(largest_party_share))

m1 <- feols(log_days ~ enp, data = reg_data)
m2 <- feols(log_days ~ enp + largest_party_share + year, data = reg_data)
m3_cl <- feols(log_days ~ enp + largest_party_share + year | country, 
               data = reg_data, cluster = ~country)

# 提取ENP系数和置信区间
coef_plot_data <- data.frame(
  model = c("Model 1\n(Baseline OLS)", 
            "Model 2\n(With Controls)", 
            "Model 3\n(Country FE)"),
  estimate = c(coef(m1)["enp"], coef(m2)["enp"], coef(m3_cl)["enp"]),
  ci_low = c(confint(m1)["enp", 1], confint(m2)["enp", 1], confint(m3_cl)["enp", 1]),
  ci_high = c(confint(m1)["enp", 2], confint(m2)["enp", 2], confint(m3_cl)["enp", 2])
)

fig5 <- coef_plot_data %>%
  mutate(model = factor(model, levels = model)) %>%
  ggplot(aes(x = model, y = estimate)) +
  geom_hline(yintercept = 0, linetype = "dashed", color = "gray50") +
  geom_pointrange(aes(ymin = ci_low, ymax = ci_high), 
                  size = 0.8, linewidth = 1.2, color = "steelblue") +
  labs(
    title = "Effect of Party Fragmentation on Government Formation Duration",
    subtitle = "ENP coefficient across model specifications (95% CI)",
    x = NULL,
    y = "Coefficient on ENP"
  ) +
  theme_minimal()

fig5
ggsave("figures/fig5_coef_plot.png", fig5, width = 8, height = 5, dpi = 300)
