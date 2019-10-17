# tables 501-505

library(tidyverse)
library(scales)

df <- read_csv2("Survey_consolidated_filter_23092019.csv") %>%
  mutate_if(is.character, 
            ~replace(., grepl("Bachelor/engineer", .), "BA/engineer")) %>%
  filter(n_complete > 90)
#company_type == "i")

weights <- seq(0,100,100/3)

# 501 Specialists in bio-based sector business/market development
#----
table_501 <- df %>% 
  select(starts_with("q_501")) %>%
  gather() %>%
  filter(!is.na(value)) %>%
  count(key,value) %>%
  filter(value != "Not selected") %>%
  mutate(Category = recode(key, 
                           q_501_1 = "Bio-based-market knowledge & tecno-economical expertise",
                           q_501_2 = "To raise society\'s awareness on circular bio-based economy",
                           q_501_3 = "Identify and create market applications for new bio-based products",
                           q_501_4 = "New Blue-Bio-based Business models and Value chains",
                           q_501_5 = "New Bio-based Business Models based on technological surveillance, competitive intelligence and financing capture")) %>%
  select(-key) %>%
  pivot_wider(names_from = value,values_from = n) %>%
  select(Category, VET = `Vocational Education and Training (VET)*`,
         `BA/engineer`, Master, PhD, everything()) %>%
  mutate_if(is.numeric, ~replace(., is.na(.), 0)) %>%
  mutate(sum_n = rowSums(select(., -Category))) %>%
  mutate(w_sum =
           VET          * weights[1] +
           `BA/engineer` * weights[2] +
           Master       * weights[3] +
           PhD          * weights[4],
         score = w_sum/sum_n)

write_csv2(table_501,"Tables/table_501.csv")

# 502 Technical expertise in sustainable biomass production
#----
table_502 <- df %>% 
  select(starts_with("q_502")) %>%
  gather() %>%
  filter(!is.na(value)) %>%
  count(key,value) %>%
  filter(value != "Not selected") %>%
  mutate(Category = recode(key, 
                           q_502_1 = "Advanced pre-treatments at harvest-storage stage",
                           q_502_2 = "Precision farming",
                           q_502_3 = "Feedstock-specific & market driven cascade valorization",
                           q_502_4 = "Precision equipment for biomass harvest/collection",
                           q_502_5 = "Advance ICT applications to logistic/storage (IoT, industry 4.0 ...)",
                           q_502_6 = "Techno-economic assessment of processes, biorefineries and bio-based value chains",
                           q_502_7 = "Life Cycle assessment of processes, biorefineries and bio-based value chains",
                           q_502_8 = "New varieties of macro- micro- organisms for cost-effective bio-products")) %>%
  select(-key) %>%
  pivot_wider(names_from = value,values_from = n) %>%
  select(Category, VET = `Vocational Education and Training (VET)*`,
         `BA/engineer`, Master, PhD, everything()) %>%
  mutate_if(is.numeric, ~replace(., is.na(.), 0)) %>%
  mutate(sum_n = rowSums(select(., -Category))) %>%
  mutate(w_sum =
           VET          * weights[1] +
           `BA/engineer` * weights[2] +
           Master       * weights[3] +
           PhD          * weights[4],
         score = w_sum/sum_n)

write_csv2(table_502,"Tables/table_502.csv")

# 503 Technical expertise in primary conversion processes
#----
table_503 <- df %>% 
  select(starts_with("q_503")) %>%
  gather() %>%
  filter(!is.na(value)) %>%
  count(key,value) %>%
  filter(value != "Not selected") %>%
  mutate(Category = recode(key, 
                           q_503_1 = "Methods for efficient and cost-effective biomass production",
                           q_503_2 = "Advanced technologies to mildly extract or separate functional components",
                           q_503_3 = "Market flexible and feedstock adaptable multiproduct integrated biorefineries",
                           q_503_4 = "New processes to improve bioproducts yield from biowaste",
                           q_503_5 = "Implementation of cascade biomass valorization approach in integrated biorefineries",
                           q_503_6 = "New Industrial symbiosis designs and implementation in integrated biorefineries",
                           q_503_7 = "Biotechnologies to convert C02 effluents to biochemicals")) %>%
  select(-key) %>%
  pivot_wider(names_from = value,values_from = n) %>%
  select(Category, VET = `Vocational Education and Training (VET)*`,
         `BA/engineer`, Master, PhD, everything()) %>%
  mutate_if(is.numeric, ~replace(., is.na(.), 0)) %>%
  mutate(sum_n = rowSums(select(., -Category))) %>%
  mutate(w_sum =
           VET           * weights[1] +
           `BA/engineer` * weights[2] +
           Master        * weights[3] +
           PhD           * weights[4],
         score = w_sum/sum_n)

write_csv2(table_503,"Tables/table_503.csv")

# 504 Technical expertise in secondary conversion processes
#----
table_504 <- df %>% 
  select(starts_with("q_504")) %>%
  gather() %>%
  filter(!is.na(value)) %>%
  count(key,value) %>%
  filter(value != "Not selected") %>%
  mutate(Category = recode(key, 
                           q_504_1 = "Chemo-catalysis & Thermo-chemical processes to obtain functionalised chemicals and products",
                           q_504_2 = "Hybridization of processes for different feedstock valorization",
                           q_504_3 = "New more efficient methods to recover/convert bio-based chemicals including cascade valorization and circular economy approaches",
                           q_504_4 = "Design of control systems for robust, stable and sustainable production, quality and contaminants monitoring",
                           q_504_5 = "Advanced methods to preserve and generate functional natural macromolecular polymers",
                           q_504_6 = "Biopolymer processing to obtain different materials (films, fibres, structural composites) for automotive, agriculture, building, etc...",
                           q_504_7 = "Polymerisation processes based on new bio-based monomers",
                           q_504_8 = "Oleochemistry (fatty acids conversion technologies) including chemistry and biotechnology")) %>%
  select(-key) %>%
  pivot_wider(names_from = value,values_from = n) %>%
  select(Category, VET = `Vocational Education and Training (VET)*`,
         `BA/engineer`, Master, PhD, everything()) %>%
  mutate_if(is.numeric, ~replace(., is.na(.), 0)) %>%
  mutate(sum_n = rowSums(select(., -Category))) %>%
  mutate(w_sum =
           VET           * weights[1] +
           `BA/engineer` * weights[2] +
           Master        * weights[3] +
           PhD           * weights[4],
         score = w_sum/sum_n)

write_csv2(table_504,"Tables/table_504.csv")

# 505 Technical expertise in materials, products and functionalization
#----
table_505 <- df %>% 
  select(starts_with("q_505")) %>%
  gather() %>%
  filter(!is.na(value)) %>%
  count(key,value) %>%
  filter(value != "Not selected") %>%
  mutate(Category = recode(key, 
                           q_505_1 = "Materials based on lignin (and bio-aromatic) chemistry",
                           q_505_2 = "Materials based on oils and fats from plants and animals (bio-based lubricants, surfactants, solvents",
                           q_505_3 = "Bio-based alternatives for existing polymers and innovative polymers from new bio-based monomers",
                           q_505_4 = "Extraction techniques to obtain High added-value biomolecules from marine, agri-food or forest biomass for pharmaceutical, nutraceutical and cosmetic sectors",
                           q_505_5 = "New (chemical) building blocks from renewable resources",
                           q_505_6 = "New functional bio-based materials and products: plastics, composites, based on lignin, starch, (nano-) cellulose or carbon fibres",
                           q_505_7 = "New packaging solutions derived from bio-based materials",
                           q_505_8 = "New products design from bio-waste")) %>%
  select(-key) %>%
  pivot_wider(names_from = value,values_from = n) %>%
  select(Category, VET = `Vocational Education and Training (VET)*`,
         `BA/engineer`, Master, PhD, everything()) %>%
  mutate_if(is.numeric, ~replace(., is.na(.), 0)) %>%
  mutate(sum_n = rowSums(select(., -Category))) %>%
  mutate(w_sum =
           VET           * weights[1] +
           `BA/engineer` * weights[2] +
           Master        * weights[3] +
           PhD           * weights[4],
         score = w_sum/sum_n)

write_csv2(table_505,"Tables/table_505.csv")

