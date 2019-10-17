# tables 601-605

library(tidyverse)
library(hrbrthemes)
library(scales)

theme_ubf <- function () { 
  theme_ipsum_rc(plot_title_size = 30) %+replace% 
    theme(
      plot.title = element_blank(),
      axis.title.x = element_blank(),
      axis.title.y = element_blank(),
      plot.margin = margin(1,1, 1,1, "cm"),
      axis.text.y = element_text(size = 18,hjust=1,
                                 margin = margin(r = .3, unit = "cm")),
      axis.text.x = element_text(size = 18),
      panel.grid.major.y = element_blank(),
      panel.grid.minor.y = element_blank(),
      legend.position = "top",
      legend.spacing.x = unit(.5, 'cm'),
      legend.text = element_text(size = 14),
      legend.title = element_text(size = 14)
    )
}
theme_set(theme_ubf())

df <- read_csv2("Survey_consolidated_filter_23092019.csv") %>%
  mutate_if(is.character, 
            ~replace(., grepl("Bachelor/engineer", .), "BA/engineer")) %>%
  filter(n_complete > 90)
#company_type == "i")

weights_5 <- seq(0,100,100/4)
weights_6 <- seq(0,100,100/5)
weights_7 <- seq(0,100,100/6)
weights_8 <- seq(0,100,100/7)

###############################################################
# 601 - 605
#----
table_601 <- df %>% 
  select(starts_with("q_60")) %>%
  gather() %>%
  filter(!is.na(value)) %>%
  count(key,value) %>%
  filter(value != "Not selected") %>%
  mutate(Rank = recode(key, q_601 = "1",q_602 = "2",
                       q_603 = "3",q_604 = "4",q_605 = "5")) %>%
  select(-key) %>%
  pivot_wider(names_from = Rank,values_from = n) %>%
  mutate_if(is.numeric, ~replace(., is.na(.), 0)) %>%
  mutate(sum_n = rowSums(select(., -value))) %>%
  mutate(w_sum =
           `1` * weights_5[1] +
           `2` * weights_5[2] +
           `3` * weights_5[3] +
           `4` * weights_5[4] +
           `5` * weights_5[5],
         score = w_sum/sum_n,
         sum_1_3 = `1`+`2`+`3`,
         score_1_3 = sum_1_3 / sum_n * 100,
         sum_4_5 = `4` + `5`,
         score_4_5 = sum_4_5 / sum_n * 100) %>%
  rename(Category = "value")

write_csv2(table_601,"Tables/table_601-605.csv")
