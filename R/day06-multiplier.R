library(tidyverse)

monetary_base_names <- read_csv("Data/md01_m_1.csv", locale = locale(encoding = "CP932"), skip = 3, n_max = 1, col_names = FALSE) %>% 
  slice(1) %>% 
  unlist()
monetary_base_names[1] <- "年月"

monetary_base <- 
  read_csv("Data/md01_m_1.csv", locale = locale(encoding = "CP932"), skip = 9, col_names = monetary_base_names) 

money_stock_names <- read_csv("Data/md02_m_1.csv", locale = locale(encoding = "CP932"), skip = 3, n_max = 1, col_names = FALSE) %>% 
  slice(1) %>% 
  unlist()
money_stock_names[1] <- "年月"

money_stock <- read_csv("Data/md02_m_1.csv", locale = locale(encoding = "CP932"), skip = 9, col_names = money_stock_names)


dta <- 
  monetary_base %>% 
  left_join(money_stock, by = "年月") %>% 
  mutate(ym = lubridate::ymd(年月, truncated = 1)) %>% 
  select(ym, base = マネタリーベース平均残高, m2 = `Ｍ２／平／マネーストック`) %>% 
  filter(!is.na(m2)) %>% 
  mutate(multiplier = m2 / base) 

quartz(type="pdf", file="Graphics/day06-multiplier.pdf", height = 4.2)
theme_set(theme_bw(base_family="HiraKakuProN-W3"))
ggplot(dta) +
  geom_line(aes(ym, multiplier)) +
  xlab("年") + ylab("貨幣乗数") +
  theme(text = element_text(size = 14, color = "black"),
        axis.text.x = element_text(hjust = 0.9, color = "black"),
        axis.text.y = element_text(color = "black"))

dev.off()
