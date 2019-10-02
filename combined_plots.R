# combined plots

library(cowplot)
library(scales)
library(tidyverse)

df <- read_csv2("Survey_consolidated_filter_23092019.csv") %>%
  mutate_if(is.character, 
            ~replace(., grepl("Bachelor/engineer", .), "BA/engineer")) %>%
  filter(n_complete > 90,
         company_type == "i")


#########
theme_ubf <- function () { 
  theme_ipsum_rc(plot_title_size = 28) %+replace% 
    theme(
      axis.title.x = element_blank(),
      axis.title.y = element_blank(),
      plot.margin = margin(1,1, 1,1, "cm"),
      axis.text.y = element_text(size = 18,
                                 margin = margin(r = .3, unit = "cm")),
      axis.text.x = element_text(size = 18),
      panel.grid.major.x = element_blank(),
    )
}
theme_set(theme_ubf())

############################################

 age <- df %>% 
  count(q_101) %>%
  filter(!is.na(q_101)) %>%
  mutate(pct   = n/sum(n) * 100,
         q_101 = fct_relevel(factor(q_101),"> 60", after = 6)) %>%
  ggplot(aes(q_101,pct)) +
  geom_col(fill="#98C455",color=NA) +
  scale_y_continuous(labels=percent_format(scale=1)) +
  ggtitle("Age")

# ----
# 4.1.5.	Gender distribution	"q_102"
# ----
gender <- df %>% 
  select(q_102_1,q_102_2,q_102_3) %>%
  gather() %>%
  count(key,value) %>%
  filter(value != "Not selected") %>%
  mutate(Gender = recode(key, q_102_1 = "Male",q_102_2 = "Female",q_102_3 = "Non-binary"),
         pct   = n/sum(n) * 100) %>%
  ggplot(aes(Gender,pct)) +
  geom_col(fill="#98C455",color=NA) +
  scale_y_continuous(labels=percent_format(scale=1)) +
  ggtitle("Gender")

cowplot::plot_grid(age,gender,align="v",ncol=2,rel_widths = c(7/11, 4/11))
ggsave("images/q_101_102.png", width=15,height=7)

# ----
# 4.1.6.	Educational level	q_103
# ----
education <- df %>% 
  count(q_103) %>%
  filter(!is.na(q_103)) %>%
  mutate(pct   = n/sum(n) * 100,
         q_103 = recode(q_103, 
                        "VET - Vocational Education and Training" = "VET")) %>%
  ggplot(aes(q_103,pct)) +
  geom_col(fill="#98C455",color=NA) +
  scale_y_continuous(labels=percent_format(scale=1)) +
  ggtitle("Educational level") +
  theme(axis.text.x=element_text(angle=45,vjust=1,hjust=1))
# ----
# 4.1.7.	Experiences in the bio-based industries q_104
# ----
experience <- df %>% 
  count(q_104) %>%
  filter(!is.na(q_104)) %>%
  mutate(pct   = n/sum(n) * 100,
         q_104 = fct_relevel(factor(q_104),"> 15 years", after = Inf)) %>%
  ggplot(aes(q_104,pct)) +
  geom_col(fill="#98C455",color=NA) +
  scale_y_continuous(labels=percent_format(scale=1)) +
  ggtitle("Industry experience") +
  theme(axis.text.x=element_text(angle=45,vjust=1,hjust=1))

# ----
# 4.1.8.	Job positions q_105
# ----
job_positions <- df %>% 
  count(q_105) %>%
  filter(!is.na(q_105)) %>%
  mutate(pct   = n/sum(n) * 100,
         q_105 = recode(q_105, 
                        "Plant and machine operator and assembler" = "Operator and assembler",
                        "Technician and associate professional" = "Technician and assoc. professional", 
                        "Clerical support (personal assistant, secretary, etc..)" = "Clerical support",
                        "Service and market sales worker" = "Service and market sales", 
                        "Elementary (low education level or no qualifications at all)" = "Elementary")) %>%
  ggplot(aes(reorder(q_105,pct),pct)) +
  geom_col(fill="#98C455",color=NA) +
  scale_y_continuous(labels=percent_format(scale=1)) +
  ggtitle("Job positions") +
  theme(axis.text.y = element_text(hjust=1),
        panel.grid.major.y = element_blank(),
        panel.grid.major.x = element_line()) +
  coord_flip()

bottom_row <- cowplot::plot_grid(education, experience,rel_widths = c(6/11,5/11))

cowplot::plot_grid(job_positions,bottom_row,ncol=1, rel_heights = c(5/11,6/11))
ggsave("images/q_103_104_105.png", width=10,height=10)


# countries
# ----
# 4.1.9.	Country of company headquarters distribution "q_109"
# ----
hq <- df %>% 
  filter(!is.na(q_109)) %>%
  count(q_109) %>%
  mutate(pct = n/sum(n)*100,
         q_109 = recode(q_109, "Outside the European Union" = "Outside EU")) %>%
  ggplot(aes(reorder(q_109,pct),pct)) +
  geom_col(fill="#98C455",color=NA) +
  labs(title="Country of company headquarters") +
  theme(axis.text.y = element_text(hjust=1),
        panel.grid.major.y = element_blank(),
        panel.grid.major.x = element_line()) +
  scale_y_continuous(labels=percent_format(scale=1)) +
  coord_flip() 
# ----
# 4.1.10.	Country of workplace "q_110"
# ----
workplace <- df %>% 
  filter(!is.na(q_110)) %>%
  count(q_110) %>%
  mutate(pct = n/sum(n)*100) %>%
  ggplot(aes(reorder(q_110,pct),pct)) +
  geom_col(fill="#98C455",color=NA) +
  labs(title="Country of workplace") +
  theme(axis.text.y = element_text(hjust=1),
        panel.grid.major.y = element_blank(),
        panel.grid.major.x = element_line()) +
  scale_y_continuous(labels=percent_format(scale=1)) +
  coord_flip() 

cowplot::plot_grid(hq,workplace,ncol=2)
ggsave("images/q_109_110.png", width=14,height=8)

