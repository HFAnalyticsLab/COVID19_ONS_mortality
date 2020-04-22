library(tidyverse) # CRAN v1.3.0
library(THFstyle) # [github::THF-evaluative-analytics/THFstyle] v0.0.0.9000

# Place of death
place_of_death <- read_excel(path=here::here('data', '2020Mortality.xlsx'), sheet='Covid-19 - Place of occurrence ')  

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
  mutate(week_ended=as.Date(week_ended, origin = "1899-12-30"))


EW <- ONS %>% 
  filter(country=='England and Wales') %>% 
  mutate(firstweek=ifelse(week_number==11, total_deaths, NA)) %>% 
  group_by(location) %>% 
  fill(firstweek) %>% 
  ungroup() %>% 
  mutate(proportion=total_deaths/firstweek*100)

# dates for breaks
dates <- unique(EW$week_ended)

# plot
ggplot(EW) + 
  geom_line(aes(x=week_ended, y=proportion, colour=location, group=location)) + 
  geom_point(aes(x=week_ended, y=proportion, colour=location), size=2, fill='white') +
  geom_point(aes(x=week_ended, y=proportion), color='white', size=1) + 
  scale_x_date(breaks=dates) +
  scale_y_continuous(labels = scales::percent_format(scale=1)) + 
  scale_colour_THF() + ylab('') + xlab('') + theme_THF() +
  theme(plot.title = element_text(hjust = 0)) + 
  labs(caption='Source: ONS', title = 'Deaths from any cause in care homes have increased by 99% since the start of the COVID-19 outbreak')

ggsave(here::here('output', 'deaths_by_place_of_occurence.pdf'))

# Save wide data
EW_wide <- EW %>% 
  select( week_ended, location, proportion) %>% 
  pivot_wider(id_cols = location, names_from = week_ended, values_from = proportion)
write_csv(EW_wide, here::here('data', 'England_Wales_place_of_death.csv') )
