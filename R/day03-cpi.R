# CPI のプロット

library(tidyverse)

cpicols <- readr::read_csv("Data/zdi2015s.csv", n_max = 1, col_names = FALSE)
cpicols[1] <- "年"
cpicols
  
cpi <- readr::read_csv("Data/zdi2015s.csv", skip = 6, col_names = FALSE)
names(cpi) <- as.character(cpicols[1, ])

cpi <- cpi %>% 
  select(年, 総合, 生鮮食品を除く総合, 生鮮食品及びエネルギーを除く総合) %>% 
  filter(年 >= 1995) %>% 
  gather(種別, 指数, -年)

quartz(type="pdf", file="Graphics/cpi.pdf", height = 3.2)
theme_set(theme_bw(base_family="HiraKakuProN-W3"))

ggplot(cpi) +
  geom_line(aes(x = 年, y = 指数, group = 種別)) +
  geom_point(aes(x = 年, y = 指数, shape = 種別)) +
  xlab("年度") + ylab("消費者物価指数") +
  guides(shape = guide_legend(""))

dev.off()
