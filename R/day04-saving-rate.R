# デフレーターのプロット

library(tidyverse)

expenditure <- readxl::read_excel("Data/29ffm1n_jp.xls", skip = 6)
income <- readxl::read_excel("Data/29ffm2_jp.xls", skip = 6)


consumption <- as.matrix(expenditure[1, -1])
disposable <- as.matrix(income[71 - 7, -1])

year <- as.numeric(colnames(expenditure)[-1])


df <- tibble(
  year = year,
  consumption = t(consumption),
  disposable = t(disposable)
)

df <- df %>% 
  mutate(saving = (disposable - consumption) / disposable)

# Plot
quartz(type="pdf", file="Graphics/saving-rate.pdf", height = 4.2)
theme_set(theme_bw(base_family="HiraKakuProN-W3"))
ggplot(df) +
  geom_line(aes(x = year, y = saving)) +
  geom_point(aes(x = year, y = saving)) +
  xlab("年度") + ylab("貯蓄率 = 消費 / 家計可処分所得")
dev.off()

