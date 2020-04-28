library(tidyverse)

df_long <- readRDS( here::here('data', 'EW_daily_deaths.rds'))


# Plot
ggplot(df_long) + geom_col(aes(x=date, y=deaths, fill=location)) +
  scale_x_date(date_breaks = "1 week", date_labels = "%d %b %Y") +
  scale_y_continuous(labels = scales::comma, limit=c(0,NA)) + 
  scale_fill_THF(breaks=legend_breaks, label=legend_labels, 
                 guide_legend(nrow=1, ncol=)) +
  theme_THF() +
  theme(plot.title = element_text(size=11, hjust = 0), 
        plot.title.position='plot',
        legend.position = c(0.1, 1),
        plot.caption = element_text(face = 'plain'),
        legend.margin = margin(b = 10, l = -10, unit = 'mm'),
        legend.justification = c("left", "top"),
        axis.title.y = element_text(face = 'plain', size=8),
        axis.text.x = element_text(angle = 0, vjust = 1, hjust = 0.5, face = 'plain'),
        axis.text.y = element_text(angle = 0, vjust = 0, hjust = 0, face = 'plain'),
        plot.subtitle = element_text(size = 8)) + 
  labs(caption='Source: ONS \n*hospice, other communal establishment, elsewhere', 
       title = 'Deaths from any cause by place of death in England and Wales',
       y='', x='')

ggsave(here::here('output', 'daily_deaths_by_place_of_occurence_bar_4groups.pdf'))
