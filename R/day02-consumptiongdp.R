library(tidyverse)
library(ggrepel)

# How to create pwt_petit.csv
# 1. Download Penn World Table v9.1 (STATA) from 
#    https://www.rug.nl/ggdc/productivity/pwt/
# 2. Move it to Data folder in your user directory, i.e., ~/Data/pwt91.dta
# 3. Run the following 4 lines of code after removing hash tags (#).
# 4. When success, put back the has tags.
#
# pwt <- haven::read_dta("~/Data/pwt91.dta") # Path to Penn World Table v9.1
# pwt %>% 
#   select(country, year, cgdpe, ccon, pop) %>% 
#   write_excel_csv("Data/pwt_petit.csv") # write out to csv

pwt <- read_csv("Data/pwt_petit.csv")

countries <- c("Japan", "United States", "United Kingdom")
pwt_sml <- 
  pwt %>% 
  filter(year == 2014, country %in% countries)

pwt_poorest <-
  pwt %>%
  filter(year == 2014) %>% 
  filter(rank(cgdpe / pop) < 5)

quartz(type="pdf", file="Graphics/consumption-gdp.pdf", height = 4.2)
theme_set(theme_bw(base_family="HiraKakuProN-W3"))

pwt %>% 
  filter(year == 2014) %>% 
  ggplot(aes(cgdpe / pop, ccon / pop)) +
  geom_point(alpha = 0.5) + 
  geom_point(data = pwt_sml) +
  geom_label_repel(data = pwt_sml, aes(label = country)) +
  geom_label_repel(data = pwt_poorest, aes(label = country)) +
  geom_point(size = 4, shape = 1, data = pwt_sml) +
  geom_point(size = 4, shape = 1, data = pwt_poorest) +
  scale_x_log10() +
  scale_y_log10() + 
  labs(
    x = "Real GDP per capita (log)",
    y = "Real Consumption per capita (log)"
  ) +
  theme_bw() +
  theme(text = element_text(size = 14))

dev.off()




