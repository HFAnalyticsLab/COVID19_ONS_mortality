library(tidyverse)
library(THFstyle) # [github::THF-evaluative-analytics/THFstyle] v0.0.0.9000

# read in data
  
all <- readRDS(here::here('data', 'social_care_death_rates.rds'))

# Plots ---
all %>% mutate(occupations=case_when(occupations=='All men aged 20 to 64 years' ~ 'All occupations', 
                                     occupations=='All women aged 20 to 64 years' ~ 'All occupations', 
                                     TRUE ~ occupations)) %>% 
  mutate(label=paste0(occupations, '\n', rate)) %>% 
  ggplot(., aes(x=sex, y=rate, fill=occupations)) + 
  geom_col(width=0.5, position = position_dodge(width=0.8)) + theme_THF() + scale_fill_THF() +
  geom_errorbar(aes(ymax=upper_ci, ymin=lower_ci,x=sex, fill=occupations),
                width=0.5, linetype="dashed",  position=position_dodge(.8)) +
  labs(x='', y='', title= 'COVID-19 death rates per 100k population', subtitle = 'Residents of England and Wales among those aged 20 to 64 years') + 
  scale_y_continuous(limits=c(0,35)) + 
  theme(legend.position = c(0.3,0.5), 
        plot.title.position='plot', 
        plot.title = element_text(size=11, hjust = 0), 
        panel.grid.major.y=element_blank(), 
        axis.ticks = element_blank(),
        axis.text.x = element_text(size=10, angle = 0, vjust = 1, hjust = 0.5, face = 'plain'))

ggsave(here::here('death_rates_care_workers_CI.png'))

all %>% mutate(occupations=case_when(occupations=='All men aged 20 to 64 years' ~ 'All occupations', 
                                     occupations=='All women aged 20 to 64 years' ~ 'All occupations', 
                                     TRUE ~ occupations)) %>% 
  mutate(label=paste0(occupations, '\n',  rate)) %>% 
  mutate(label=str_replace(label, 'workers', '\nworkers')) %>%
  ggplot(., aes(x=sex, y=rate, fill=occupations)) + 
   geom_text(size=2, aes(label=label, fill=occupations, vjust=-0.5), position = position_dodge(width = 0.8) ) +
  geom_col(width=0.5, position = position_dodge(width=0.8)) + theme_THF() + 
  geom_errorbar(aes(ymax=upper_ci, ymin=lower_ci,x=sex, fill=occupations),
               width=0.5, linetype="dashed", position=position_dodge(.8)) +
  scale_fill_THF() +
  labs(x='', y='', title= 'COVID-19 death rates per 100k population', subtitle = 'Residents of England and Wales among those aged 20 to 64 years') + 
  scale_y_continuous(limits=c(0,35)) + 
  theme(legend.position = 'none', 
        plot.title.position='plot', 
        plot.title = element_text(size=11, hjust = 0), 
        plot.subtitle = element_text(size = 8),
        panel.grid.major.y=element_blank(), 
        axis.ticks = element_blank(),
        axis.line.x =  element_blank(),
        axis.text.x = element_text(size=10, angle = 0, vjust = 1, hjust = 0.5, face = 'plain'))
ggsave(here::here('death_rates_care_workers.png'))

