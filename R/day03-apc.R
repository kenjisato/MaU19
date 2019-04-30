# 家計調査

library(tidyverse)

dta <- readxl::read_excel("Data/a206-3.xls")
dfmat <- t(as.matrix(dta[c(239, 255), 17:34]))

df <- tibble(
  income = as.numeric(dfmat[, 1]) * 12 / 10000,
  apc = as.numeric(dfmat[, 2])
)

# Plot
quartz(type="pdf", file="Graphics/apc.pdf", height = 4.2)
theme_set(theme_bw(base_family="HiraKakuProN-W3"))

ggplot(df, aes(income, apc)) +
  geom_point() +
  geom_line() +
  xlab("可処分所得（万円）") + ylab("平均消費性向（%）")

dev.off()

