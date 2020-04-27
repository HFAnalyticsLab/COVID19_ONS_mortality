library(tidyverse) # CRAN v1.3.0
library(readxl)
library(janitor)

# Place of death
place_of_death <- read_excel(path=here::here('data', 'original data', '2020Mortality.xlsx'), sheet='Covid-19 - Place of occurrence ')  

ONS <- place_of_death %>%
  clean_names() %>% 
  filter(row_number()<14, row_number()>=3) %>% 
  remove_empty(c("rows","cols")) %>% 
  t() %>% 
  as.data.frame() %>% 
  row_to_names(row_number=1) %>% 
  clean_names() %>% 
  rename(country=na, type_of_death=na_2) %>% 
  fill(week_number, week_ended, country) %>% 
  pivot_longer(-c(week_number, week_ended, country, type_of_death)) %>% 
  pivot_wider(-type_of_death, names_from = type_of_death, 
              values_from = value) %>% 
  clean_names() %>% 
  mutate_all(as.character) %>% 
  mutate_at(vars(week_number, week_ended, total_deaths, covid_19_deaths), as.numeric) %>% 
  rename(location=name) %>% 
  mutate(covid_p=covid_19_deaths/total_deaths) %>% 
  mutate(week_ended=as.Date(week_ended, origin = "1899-12-30"), 
         location=fct_recode(location,
                             "Home" = "home",
                             "Hospital (acute or community, not psychiatric)" = "hospital_acute_or_community_not_psychiatric",
                             "Hospice" = "hospice",
                             "Care home" = "care_home",
                             "Other communal establishment" = "other_communal_establishment",
                             "Elsewhere" = "elsewhere"))


EW <- ONS %>% 
  filter(country=='England and Wales') %>% 
  mutate(firstweek=ifelse(week_number==11, total_deaths, NA)) %>% 
  group_by(location) %>% 
  fill(firstweek) %>% 
  ungroup() %>% 
  mutate(proportion_0_base=total_deaths/firstweek*100-100)

saveRDS(EW, here::here('data', 'EW_weekly_deaths.rds'))
