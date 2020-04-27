library(tidyverse) # CRAN v1.3.0
library(THFstyle) # [github::THF-evaluative-analytics/THFstyle] v0.0.0.9000

EW <- readRDS(here::here('data', 'EW_weekly_deaths.rds'))

# Labels and breaks for plots
date_breaks <- unique(EW$week_ended)

ggplot(EW) + geom_col(aes(x=week_ended, y=total_deaths, fill=location)) +
  scale_x_date(breaks=date_breaks, date_labels = "%d %b %Y") +
  scale_y_continuous(labels = scales::comma, limit=c(0,20000)) + 
  scale_fill_THF(breaks=legend_breaks, label=legend_labels, 
                 guide_legend(nrow=1, ncol=)) +
  theme_THF() +
  theme(plot.title = element_text(size=11, hjust = 0), 
        plot.title.position='plot',
        legend.margin = margin(b = 10, l = -10, unit = 'mm'),
        legend.justification = c("left", "top"),
        axis.title.y = element_text(face = 'plain', size=8),
        axis.text.x = element_text(angle = 0, vjust = 1, hjust = 0.5, face = 'plain'),
        axis.text.y = element_text(angle = 0, vjust = 0, hjust = 0, face = 'plain'),
        plot.subtitle = element_text(size = 8)) + 
  labs(caption='Source: ONS', 
      title = 'Weekly deaths from any cause by place of death in England and Wales',
       y='', x='')

ggsave(here::here('output', 'deaths_by_place_of_occurence_bar_chart.pdf'))

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
