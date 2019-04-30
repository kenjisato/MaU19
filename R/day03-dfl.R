# デフレーターのプロット

library(tidyverse)

dta <- readxl::read_excel("Data/29ffm1dn_jp.xls", skip = 6)
dfl <- as.matrix(dta[c(37, 40, 44, 51) - 7, -1])

type <- c("輸出", "輸入", "GDP", "国内需要")

year <- as.numeric(colnames(dfl))
dflt <- t(dfl)

df <- tibble(
  年 = year,
  a = numeric(length(year)),
  b = numeric(length(year)),
  c = numeric(length(year)),
  d = numeric(length(year))
)
names(df)[-1] <- type
for (i in seq_along(type)){
  df[[i + 1]] <- as.numeric(dflt[, i]) 
}

dflong <- df %>% 
  gather(key = "項目", value = "デフレーター", -年)

# Plot
quartz(type="pdf", file="Graphics/deflator.pdf", height = 4.2)
theme_set(theme_bw(base_family="HiraKakuProN-W3"))
ggplot(dflong) +
  geom_line(aes(x = 年, y = デフレーター, group = 項目)) +
  geom_point(aes(x = 年, y = デフレーター, shape = 項目)) +
  xlab("年度") + ylab("デフレーター") +
  guides(shape = guide_legend(""))
dev.off()


# Plot
quartz(type="pdf", file="Graphics/termsoftrade.pdf", height = 4.2)
theme_set(theme_bw(base_family="HiraKakuProN-W3"))
ggplot(df, aes(x = 年, y = 輸出 / 輸入)) +
  geom_line() + geom_point() +
  xlab("年度") + ylab("交易条件") 
dev.off()

