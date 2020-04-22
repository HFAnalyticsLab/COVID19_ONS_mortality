library(tidyverse) # CRAN v1.3.0
library(readxl)
library(janitor)
library(THFstyle) # [github::THF-evaluative-analytics/THFstyle] v0.0.0.9000

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


# Labels and breaks for plots
date_breaks <- unique(EW$week_ended)


# plot
ggplot(EW) + 
  geom_line(aes(x=week_ended, y=proportion_0_base, colour=location, group=location)) + 
  geom_point(aes(x=week_ended, y=proportion_0_base, colour=location), size=2, fill='white') +
  geom_point(aes(x=week_ended, y=proportion_0_base), color='white', size=1) + 
  scale_x_date(breaks=date_breaks, date_labels = "%d %b %Y") +
  scale_y_continuous(labels = scales::percent_format(scale=1), limits = c(-60,100)) + 
  scale_colour_THF(breaks=legend_breaks, label=legend_labels) +
  theme_THF() +
  theme(plot.title = element_text(size=11, hjust = 0), 
        plot.title.position='plot',
        legend.margin = margin(b = 10, l = -10, unit = 'mm'),
        legend.justification = c("right", "top"),
        axis.title.y = element_text(face = 'plain', size=8),
        axis.text.x = element_text(angle = 0, vjust = 1, hjust = 0.5, face = 'plain'),
        axis.text.y = element_text(angle = 0, vjust = 0, hjust = 0, face = 'plain'),
        plot.subtitle = element_text(size = 8)) + 
  labs(caption='Source: ONS', 
       title = 'Deaths from any cause in care homes have increased by 99% since \nthe start of the COVID-19 outbreak',
       subtitle = 'Percentage change in deaths from any cause by place of death in England and Wales, \nrelative to the week of 13 March 2020',
       y='Percentage change', x='')


ggsave(here::here('output', 'deaths_by_place_of_occurence.pdf'))

# Save wide data
EW_wide <- EW %>% 
  select( week_ended, location, proportion) %>% 
  pivot_wider(id_cols = location, names_from = week_ended, values_from = proportion)
write_csv(EW_wide, here::here('data', 'England_Wales_place_of_death.csv') )
