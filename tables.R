# tables

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
# 201 Management - 8 categories
#----
table_201 <- df %>% 
  select(starts_with("q_201")) %>%
  gather() %>%
  filter(!is.na(value)) %>%
  count(key,value) %>%
  filter(value != "Not selected") %>%
  mutate(Rank = recode(key, q_201_1 = "1",q_201_2 = "2",
                       q_201_3 = "3",q_201_4 = "4",q_201_5 = "5",
                       q_201_6 = "6",q_201_7 = "7",q_201_8 = "8")) %>%
  select(-key) %>%
  pivot_wider(names_from = Rank,values_from = n) %>%
  mutate(sum_n = rowSums(select(., -value))) %>%
  mutate(w_sum =
           `1` * weights_8[1] +
           `2` * weights_8[2] +
           `3` * weights_8[3] +
           `4` * weights_8[4] +
           `5` * weights_8[5] +
           `6` * weights_8[6] +
           `7` * weights_8[7] +
           `8` * weights_8[8],
         score = w_sum/sum_n,
         sum_1_3 = `1`+`2`+`3`,
         score_1_3 = sum_1_3 / sum_n * 100,
         sum_4_5 = `4` + `5`,
         score_4_5 = sum_4_5 / sum_n * 100,
         sum_6_8 = `6` + `7` + `8`,
         score_6_8 = sum_6_8 / sum_n * 100) %>%
  rename(Category = "value")

write_csv2(table_201,"Tables/table_201.csv")

# 202 Data Management - 7 categories
#----
table_202 <- df %>% 
  select(starts_with("q_202")) %>%
  gather() %>%
  filter(!is.na(value)) %>%
  count(key,value) %>%
  filter(value != "Not selected") %>%
  mutate(Rank = recode(key, q_202_1 = "1",q_202_2 = "2",
                       q_202_3 = "3",q_202_4 = "4",q_202_5 = "5",
                       q_202_6 = "6",q_202_7 = "7",q_202_8 = "8")) %>%
  select(-key) %>%
  pivot_wider(names_from = Rank,values_from = n) %>%
  mutate_if(is.numeric, ~replace(., is.na(.), 0)) %>%
  mutate(sum_n = rowSums(select(., -value))) %>%
  mutate(w_sum =
           `1` * weights_7[1] +
           `2` * weights_7[2] +
           `3` * weights_7[3] +
           `4` * weights_7[4] +
           `5` * weights_7[5] +
           `6` * weights_7[6] +
           `7` * weights_7[7],
         score = w_sum/sum_n,
         sum_1_3 = `1`+`2`+`3`,
         score_1_3 = sum_1_3 / sum_n * 100,
         sum_4_5 = `4` + `5`,
         score_4_5 = sum_4_5 / sum_n * 100,
         sum_6_7 = `6` + `7`,
         score_6_7 = sum_6_7 / sum_n * 100) %>%
  rename(Category = "value")

write_csv2(table_202,"Tables/table_202.csv")

# ----
# 203 Personal initiative and entrepreneurship - 7 catrgories
#----

table_203 <- df %>% 
  select(starts_with("q_203")) %>%
  gather() %>%
  filter(!is.na(value)) %>%
  count(key,value) %>%
  filter(value != "Not selected") %>%
  mutate(Rank = recode(key, q_203_1 = "1",q_203_2 = "2",
                       q_203_3 = "3",q_203_4 = "4",q_203_5 = "5",
                       q_203_6 = "6",q_203_7 = "7",q_203_8 = "8")) %>%
  select(-key) %>%
  pivot_wider(names_from = Rank,values_from = n) %>%
  mutate_if(is.numeric, ~replace(., is.na(.), 0)) %>%
  mutate(sum_n = rowSums(select(., -value))) %>%
  mutate(w_sum =
           `1` * weights_7[1] +
           `2` * weights_7[2] +
           `3` * weights_7[3] +
           `4` * weights_7[4] +
           `5` * weights_7[5] +
           `6` * weights_7[6] +
           `7` * weights_7[7],
         score = w_sum/sum_n,
         sum_1_3 = `1`+`2`+`3`,
         score_1_3 = sum_1_3 / sum_n * 100,
         sum_4_5 = `4` + `5`,
         score_4_5 = sum_4_5 / sum_n * 100,
         sum_6_7 = `6` + `7`,
         score_6_7 = sum_6_7 / sum_n * 100) %>%
  rename(Category = "value")

write_csv2(table_203,"Tables/table_203.csv")

# ----
# 204 Soft Skills
#----

table_204 <- df %>% 
  select(starts_with("q_204")) %>%
  gather() %>%
  filter(!is.na(value)) %>%
  count(key,value) %>%
  filter(value != "Not selected") %>%
  mutate(Rank = recode(key, q_204_1 = "1",q_204_2 = "2",
                       q_204_3 = "3",q_204_4 = "4",q_204_5 = "5",
                       q_204_6 = "6",q_204_7 = "7",q_204_8 = "8")) %>%
  select(-key) %>%
  pivot_wider(names_from = Rank,values_from = n) %>%
  mutate_if(is.numeric, ~replace(., is.na(.), 0)) %>%
  mutate(sum_n = rowSums(select(., -value))) %>%
  mutate(w_sum =
           `1` * weights_8[1] +
           `2` * weights_8[2] +
           `3` * weights_8[3] +
           `4` * weights_8[4] +
           `5` * weights_8[5] +
           `6` * weights_8[6] +
           `7` * weights_8[7] +
           `8` * weights_8[8] ,
         score = w_sum/sum_n,
         sum_1_3 = `1`+`2`+`3`,
         score_1_3 = sum_1_3 / sum_n * 100,
         sum_4_5 = `4` + `5`,
         score_4_5 = sum_4_5 / sum_n * 100,
         sum_6_8 = `6` + `7` + `8`,
         score_6_8 = sum_6_8 / sum_n * 100) %>%
  rename(Category = "value")

write_csv2(table_204,"Tables/table_204.csv")

# ----
# 205 Sustainability and Industry
# ----
table_205 <- df %>% 
  select(starts_with("q_205")) %>%
  gather() %>%
  filter(!is.na(value)) %>%
  count(key,value) %>%
  filter(value != "Not selected") %>%
  mutate(Rank = recode(key, q_205_1 = "1",q_205_2 = "2",
                       q_205_3 = "3",q_205_4 = "4",q_205_5 = "5",
                       q_205_6 = "6",q_205_7 = "7",q_205_8 = "8")) %>%
  select(-key) %>%
  pivot_wider(names_from = Rank,values_from = n) %>%
  mutate_if(is.numeric, ~replace(., is.na(.), 0)) %>%
  mutate(sum_n = rowSums(select(., -value))) %>%
  mutate(w_sum =
           `1` * weights_6[1] +
           `2` * weights_6[2] +
           `3` * weights_6[3] +
           `4` * weights_6[4] +
           `5` * weights_6[5] +
           `6` * weights_6[6],
         score = w_sum/sum_n,
         sum_1_3 = `1`+`2`+`3`,
         score_1_3 = sum_1_3 / sum_n * 100,
         sum_4_6 = `4` + `5` + `6`,
         score_4_6 = sum_4_6 / sum_n * 100) %>%
  rename(Category = "value")

write_csv2(table_205,"Tables/table_205.csv")

# ----
# 206 Technology / STEM (Science, Technology, Engineering and Maths)
# 8 categories
#----

table_206 <- df %>% 
  select(starts_with("q_206")) %>%
  gather() %>%
  filter(!is.na(value)) %>%
  count(key,value) %>%
  filter(value != "Not selected") %>%
  mutate(Rank = recode(key, q_206_1 = "1",q_206_2 = "2",
                       q_206_3 = "3",q_206_4 = "4",q_206_5 = "5",
                       q_206_6 = "6",q_206_7 = "7",q_206_8 = "8")) %>%
  select(-key) %>%
  pivot_wider(names_from = Rank,values_from = n) %>%
  mutate_if(is.numeric, ~replace(., is.na(.), 0)) %>%
  mutate(sum_n = rowSums(select(., -value))) %>%
  mutate(w_sum =
           `1` * weights_8[1] +
           `2` * weights_8[2] +
           `3` * weights_8[3] +
           `4` * weights_8[4] +
           `5` * weights_8[5] +
           `6` * weights_8[6] +
           `7` * weights_8[7] +
           `8` * weights_8[8],
         score = w_sum/sum_n,
         sum_1_3 = `1`+`2`+`3`,
         score_1_3 = sum_1_3 / sum_n * 100,
         sum_4_5 = `4` + `5`,
         score_4_5 = sum_4_5 / sum_n * 100,
         sum_6_8 = `6` + `7` + `8`,
         score_6_8 = sum_6_8 / sum_n * 100) %>%
  rename(Category = "value")

write_csv2(table_206,"Tables/table_206.csv")

# ----
# 207 Research & Innovation
# 5 categories
#----

table_207 <- df %>% 
  select(starts_with("q_207")) %>%
  gather() %>%
  filter(!is.na(value)) %>%
  count(key,value) %>%
  filter(value != "Not selected") %>%
  mutate(Rank = recode(key, q_207_1 = "1",q_207_2 = "2",
                       q_207_3 = "3",q_207_4 = "4",q_207_5 = "5",
                       q_207_6 = "6",q_207_7 = "7",q_207_8 = "8")) %>%
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

write_csv2(table_207,"Tables/table_207.csv")
# ----
# 208 Basic Scientific Knowledge
# 8 categories
#----

table_208 <- df %>% 
  select(starts_with("q_208")) %>%
  gather() %>%
  filter(!is.na(value)) %>%
  count(key,value) %>%
  filter(value != "Not selected") %>%
  mutate(Rank = recode(key, q_208_1 = "1",q_208_2 = "2",
                       q_208_3 = "3",q_208_4 = "4",q_208_5 = "5",
                       q_208_6 = "6",q_208_7 = "7",q_208_8 = "8")) %>%
  select(-key) %>%
  pivot_wider(names_from = Rank,values_from = n) %>%
  mutate_if(is.numeric, ~replace(., is.na(.), 0)) %>%
  mutate(sum_n = rowSums(select(., -value))) %>%
  mutate(w_sum =
           `1` * weights_8[1] +
           `2` * weights_8[2] +
           `3` * weights_8[3] +
           `4` * weights_8[4] +
           `5` * weights_8[5] +
           `6` * weights_8[6] +
           `7` * weights_8[7] +
           `8` * weights_8[8],
         score = w_sum/sum_n,
         sum_1_3 = `1`+`2`+`3`,
         score_1_3 = sum_1_3 / sum_n * 100,
         sum_4_5 = `4` + `5`,
         score_4_5 = sum_4_5 / sum_n * 100,
         sum_6_8 = `6` + `7` + `8`,
         score_6_8 = sum_6_8 / sum_n * 100) %>%
  rename(Category = "value")

write_csv2(table_208,"Tables/table_208.csv")

# ----
# 209 social responsibility - CSR
# 8 categories
#----

table_209 <- df %>% 
  select(starts_with("q_209")) %>%
  gather() %>%
  filter(!is.na(value)) %>%
  count(key,value) %>%
  filter(value != "Not selected") %>%
  mutate(Rank = recode(key, q_209_1 = "1",q_209_2 = "2",
                       q_209_3 = "3",q_209_4 = "4",q_209_5 = "5",
                       q_209_6 = "6",q_209_7 = "7",q_209_8 = "8")) %>%
  select(-key) %>%
  pivot_wider(names_from = Rank,values_from = n) %>%
  mutate_if(is.numeric, ~replace(., is.na(.), 0)) %>%
  mutate(sum_n = rowSums(select(., -value))) %>%
  mutate(w_sum =
           `1` * weights_8[1] +
           `2` * weights_8[2] +
           `3` * weights_8[3] +
           `4` * weights_8[4] +
           `5` * weights_8[5] +
           `6` * weights_8[6] +
           `7` * weights_8[7] +
           `8` * weights_8[8],
         score = w_sum/sum_n,
         sum_1_3 = `1`+`2`+`3`,
         score_1_3 = sum_1_3 / sum_n * 100,
         sum_4_5 = `4` + `5`,
         score_4_5 = sum_4_5 / sum_n * 100,
         sum_6_8 = `6` + `7` + `8`,
         score_6_8 = sum_6_8 / sum_n * 100) %>%
  rename(Category = "value")

write_csv2(table_209,"Tables/table_209.csv")
# ----
# 210 Rules and Regulations
# 8 categories
#----

table_210 <- df %>% 
  select(starts_with("q_210")) %>%
  gather() %>%
  filter(!is.na(value)) %>%
  count(key,value) %>%
  filter(value != "Not selected") %>%
  mutate(Rank = recode(key, q_210_1 = "1",q_210_2 = "2",
                       q_210_3 = "3",q_210_4 = "4",q_210_5 = "5",
                       q_210_6 = "6",q_210_7 = "7",q_210_8 = "8")) %>%
  select(-key) %>%
  pivot_wider(names_from = Rank,values_from = n) %>%
  mutate_if(is.numeric, ~replace(., is.na(.), 0)) %>%
  mutate(sum_n = rowSums(select(., -value))) %>%
  mutate(w_sum =
           `1` * weights_8[1] +
           `2` * weights_8[2] +
           `3` * weights_8[3] +
           `4` * weights_8[4] +
           `5` * weights_8[5] +
           `6` * weights_8[6] +
           `7` * weights_8[7] +
           `8` * weights_8[8],
         score = w_sum/sum_n,
         sum_1_3 = `1`+`2`+`3`,
         score_1_3 = sum_1_3 / sum_n * 100,
         sum_4_5 = `4` + `5`,
         score_4_5 = sum_4_5 / sum_n * 100,
         sum_6_8 = `6` + `7` + `8`,
         score_6_8 = sum_6_8 / sum_n * 100) %>%
  rename(Category = "value")

write_csv2(table_210,"Tables/table_210.csv")

# ----
# 211 Sales and Marketing
# 8 categories
#----

table_211 <- df %>% 
  select(starts_with("q_211")) %>%
  gather() %>%
  filter(!is.na(value)) %>%
  count(key,value) %>%
  filter(value != "Not selected") %>%
  mutate(Rank = recode(key, q_211_1 = "1",q_211_2 = "2",
                       q_211_3 = "3",q_211_4 = "4",q_211_5 = "5",
                       q_211_6 = "6",q_211_7 = "7",q_211_8 = "8")) %>%
  select(-key) %>%
  pivot_wider(names_from = Rank,values_from = n) %>%
  mutate_if(is.numeric, ~replace(., is.na(.), 0)) %>%
  mutate(sum_n = rowSums(select(., -value))) %>%
  mutate(w_sum =
           `1` * weights_6[1] +
           `2` * weights_6[2] +
           `3` * weights_6[3] +
           `4` * weights_6[4] +
           `5` * weights_6[5] +
           `6` * weights_6[6],
         score = w_sum/sum_n,
         sum_1_3 = `1`+`2`+`3`,
         score_1_3 = sum_1_3 / sum_n * 100,
         sum_4_6 = `4` + `5` + `6`,
         score_4_6 = sum_4_6 / sum_n * 100) %>%
  rename(Category = "value")

write_csv2(table_211,"Tables/table_211.csv")


# ----
# 301 Specialists in bio-based sector business/market development
# 5 categories
#----

table_301 <- df %>% 
  select(starts_with("q_301")) %>%
  gather() %>%
  filter(!is.na(value)) %>%
  count(key,value) %>%
  filter(value != "Not selected") %>%
  mutate(Rank = recode(key, q_301_1 = "1",q_301_2 = "2",
                       q_301_3 = "3",q_301_4 = "4",q_301_5 = "5",
                       q_301_6 = "6",q_301_7 = "7",q_301_8 = "8")) %>%
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

write_csv2(table_301,"Tables/table_301.csv")

# ----
# 302 Technical expertise in sustainable biomass production
# 8 categories
#----

table_302 <- df %>% 
  select(starts_with("q_302")) %>%
  gather() %>%
  filter(!is.na(value)) %>%
  count(key,value) %>%
  filter(value != "Not selected") %>%
  mutate(Rank = recode(key, q_302_1 = "1",q_302_2 = "2",
                       q_302_3 = "3",q_302_4 = "4",q_302_5 = "5",
                       q_302_6 = "6",q_302_7 = "7",q_302_8 = "8")) %>%
  select(-key) %>%
  pivot_wider(names_from = Rank,values_from = n) %>%
  mutate_if(is.numeric, ~replace(., is.na(.), 0)) %>%
  mutate(sum_n = rowSums(select(., -value))) %>%
  mutate(w_sum =
           `1` * weights_8[1] +
           `2` * weights_8[2] +
           `3` * weights_8[3] +
           `4` * weights_8[4] +
           `5` * weights_8[5] +
           `6` * weights_8[6] +
           `7` * weights_8[7] +
           `8` * weights_8[8],
         score = w_sum/sum_n,
         sum_1_3 = `1`+`2`+`3`,
         score_1_3 = sum_1_3 / sum_n * 100,
         sum_4_5 = `4` + `5`,
         score_4_5 = sum_4_5 / sum_n * 100,
         sum_6_8 = `6` + `7` + `8`,
         score_6_8 = sum_6_8 / sum_n * 100) %>%
  rename(Category = "value")

write_csv2(table_302,"Tables/table_302.csv")

# ----
# 303 Technical expertise in primary conversion processes
# 7 categories
#----

table_303 <- df %>% 
  select(starts_with("q_303")) %>%
  gather() %>%
  filter(!is.na(value)) %>%
  count(key,value) %>%
  filter(value != "Not selected") %>%
  mutate(Rank = recode(key, q_303_1 = "1",q_303_2 = "2",
                       q_303_3 = "3",q_303_4 = "4",q_303_5 = "5",
                       q_303_6 = "6",q_303_7 = "7",q_303_8 = "8")) %>%
  select(-key) %>%
  pivot_wider(names_from = Rank,values_from = n) %>%
  mutate_if(is.numeric, ~replace(., is.na(.), 0)) %>%
  mutate(sum_n = rowSums(select(., -value))) %>%
  mutate(w_sum =
           `1` * weights_7[1] +
           `2` * weights_7[2] +
           `3` * weights_7[3] +
           `4` * weights_7[4] +
           `5` * weights_7[5] +
           `6` * weights_7[6] +
           `7` * weights_7[7],
         score = w_sum/sum_n,
         sum_1_3 = `1`+`2`+`3`,
         score_1_3 = sum_1_3 / sum_n * 100,
         sum_4_5 = `4` + `5`,
         score_4_5 = sum_4_5 / sum_n * 100,
         sum_6_7 = `6` + `7`,
         score_6_7 = sum_6_7 / sum_n * 100) %>%
  rename(Category = "value")

write_csv2(table_303,"Tables/table_303.csv")

# ----
# 304 Technical expertise in secondary conversion processes
# 8 categories
#----

table_304 <- df %>% 
  select(starts_with("q_304")) %>%
  gather() %>%
  filter(!is.na(value)) %>%
  count(key,value) %>%
  filter(value != "Not selected") %>%
  mutate(Rank = recode(key, q_304_1 = "1",q_304_2 = "2",
                       q_304_3 = "3",q_304_4 = "4",q_304_5 = "5",
                       q_304_6 = "6",q_304_7 = "7",q_304_8 = "8")) %>%
  select(-key) %>%
  pivot_wider(names_from = Rank,values_from = n) %>%
  mutate_if(is.numeric, ~replace(., is.na(.), 0)) %>%
  mutate(sum_n = rowSums(select(., -value))) %>%
  mutate(w_sum =
           `1` * weights_8[1] +
           `2` * weights_8[2] +
           `3` * weights_8[3] +
           `4` * weights_8[4] +
           `5` * weights_8[5] +
           `6` * weights_8[6] +
           `7` * weights_8[7] +
           `8` * weights_8[8],
         score = w_sum/sum_n,
         sum_1_3 = `1`+`2`+`3`,
         score_1_3 = sum_1_3 / sum_n * 100,
         sum_4_5 = `4` + `5`,
         score_4_5 = sum_4_5 / sum_n * 100,
         sum_6_8 = `6` + `7` + `8`,
         score_6_8 = sum_6_8 / sum_n * 100) %>%
  rename(Category = "value")

write_csv2(table_304,"Tables/table_304.csv")

# ----
# 305 Technical expertise in materials, products and functionalization
# 8 categories
#----

table_305 <- df %>% 
  select(starts_with("q_305")) %>%
  gather() %>%
  filter(!is.na(value)) %>%
  count(key,value) %>%
  filter(value != "Not selected") %>%
  mutate(Rank = recode(key, q_305_1 = "1",q_305_2 = "2",
                       q_305_3 = "3",q_305_4 = "4",q_305_5 = "5",
                       q_305_6 = "6",q_305_7 = "7",q_305_8 = "8")) %>%
  select(-key) %>%
  pivot_wider(names_from = Rank,values_from = n) %>%
  mutate_if(is.numeric, ~replace(., is.na(.), 0)) %>%
  mutate(sum_n = rowSums(select(., -value))) %>%
  mutate(w_sum =
           `1` * weights_8[1] +
           `2` * weights_8[2] +
           `3` * weights_8[3] +
           `4` * weights_8[4] +
           `5` * weights_8[5] +
           `6` * weights_8[6] +
           `7` * weights_8[7] +
           `8` * weights_8[8],
         score = w_sum/sum_n,
         sum_1_3 = `1`+`2`+`3`,
         score_1_3 = sum_1_3 / sum_n * 100,
         sum_4_5 = `4` + `5`,
         score_4_5 = sum_4_5 / sum_n * 100,
         sum_6_8 = `6` + `7` + `8`,
         score_6_8 = sum_6_8 / sum_n * 100) %>%
  rename(Category = "value")

write_csv2(table_305,"Tables/table_305.csv")

#############
#Figures
# # Figure 201
# 
# table_201 %>% 
#   select(Category,score_1_3,score_4_5,score_6_8) %>%
#   mutate_if(is.numeric, round) %>%
#   mutate(order=rev(row_number())) %>%
#   pivot_longer(-c(Category,order), names_to = "Rank", values_to = "Percentage") %>%
#   mutate(`Rankìng Group` = recode(Rank, 
#                        score_1_3 = "1-3",
#                        score_4_5 = "4-5",
#                        score_6_8 = "6-8")) %>%
#   ggplot(aes(x=reorder(Category,order),y=Percentage,group=rev(`Rankìng Group`),fill=`Rankìng Group`)) +
#   geom_col(width=.8) +
#   geom_text(aes(label=paste0(Percentage,"%")),
#                 position=position_stack(vjust=0.5), colour="white",
#             fontface="bold",size = 6) +
#   scale_y_continuous(labels=percent_format(scale=1,accuracy = 1)) +
#   labs(fill="Rank. Group") +
#   coord_flip() +
#   scale_fill_ubf(reverse=T)


