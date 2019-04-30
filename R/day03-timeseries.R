# 短期と長期で消費関数の推計結果が異なる

library("tidyverse")

dta_new <- 
  readxl::read_excel("Data/29qom1rn_jp.xls", skip = 4, col_names = FALSE) %>%
  filter(row_number() %in% (c(5, 7, 8, 57) - 4))
dta_new <- as_tibble(t(as.matrix(dta_new))[-1, ]) %>% 
  transmute(term = paste(V1, V2), 
            GNI = as.numeric(V4) * 4 / 1000, 
            C = as.numeric(V3) * 4 / 1000)
dta <- dta_new %>% 
  mutate(terms = factor(row_number() %/% 32, 
                        labels = c("H06Q1-H13Q3",
                                   "H13Q4-H21Q3",
                                   "H21Q4-H29Q3",
                                   "H30Q4-"))) %>% 
  filter(terms != "H30Q4-")

quartz(type="pdf", file="Graphics/cfunc.pdf", height = 4.2)
theme_set(theme_bw(base_family="HiraKakuProN-W3"))

ggplot(dta, aes(GNI, C)) +
  geom_point(aes(shape = terms)) + 
  geom_smooth(aes(group = terms), method = lm, se = FALSE, color = "gray40") +
  geom_smooth(se = FALSE, method = lm, color = "black") +
  xlab("実質国民総所得（兆円）") + ylab("実質民間消費（兆円）") +
  guides(shape = guide_legend(""))

dev.off()
