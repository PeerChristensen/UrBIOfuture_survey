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

weights <- c(100,85.71,71.43,57.14,42.86,28.57,14.29,0)

# Management - 201 & 401

#q_201
#----
table_201 <- df %>% 
  select(starts_with("q_201")) %>%
  gather() %>%
  filter(!is.na(value)) %>%
  count(key,value) %>%
  filter(value != "Not selected") %>%
  mutate(Rank = recode(key, q_201_1 = "1",q_201_2 = "2",
                       q_201_3 = "3",q_201_4 = "4",q_201_5 = "5",
                       q_201_6 = "6",q_201_7 = "7",q_201_8 = "8"),
         value = recode(value, 
                        "Life Cycle Assessment (LCA) of Bio-based industry processes" = "Life Cycle Assessment (LCA)",
                        "Development of business models" = "Business model development")) %>%
  select(-key) %>%
  pivot_wider(names_from = Rank,values_from = n) %>%
  mutate(sum_n = rowSums(select(., -value))) %>%
  mutate(w_sum =
           `1` * weights[1] +
           `2` * weights[2] +
           `3` * weights[3] +
           `4` * weights[4] +
           `5` * weights[5] +
           `6` * weights[6] +
           `7` * weights[7] +
           `8` * weights[8],
         score = w_sum/sum_n,
         sum_1_3 = `1`+`2`+`3`,
         score_1_3 = sum_1_3 / sum_n * 100,
         sum_4_5 = `4` + `5`,
         score_4_5 = sum_4_5 / sum_n * 100,
         sum_6_8 = `6` + `7` + `8`,
         score_6_8 = sum_6_8 / sum_n * 100) %>%
  rename(Category = "value")


write_csv2(table_201,"table_201_Management.csv")

# Figure 201
##### 

table_201 %>% 
  select(Category,score_1_3,score_4_5,score_6_8) %>%
  mutate_if(is.numeric, round) %>%
  mutate(order=rev(row_number())) %>%
  pivot_longer(-c(Category,order), names_to = "Rank", values_to = "Percentage") %>%
  mutate(`Rankìng Group` = recode(Rank, 
                       score_1_3 = "1-3",
                       score_4_5 = "4-5",
                       score_6_8 = "6-8")) %>%
  ggplot(aes(x=reorder(Category,order),y=Percentage,group=rev(`Rankìng Group`),fill=`Rankìng Group`)) +
  geom_col(width=.8) +
  geom_text(aes(label=paste0(Percentage,"%")),
                position=position_stack(vjust=0.5), colour="white",
            fontface="bold",size = 6) +
  scale_y_continuous(labels=percent_format(scale=1,accuracy = 1)) +
  labs(fill="Rank. Group") +
  coord_flip() +
  scale_fill_ubf(reverse=T)
  
  



