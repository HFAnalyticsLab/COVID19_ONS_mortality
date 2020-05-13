# ONS mortality

#### Project Status: [In progress]

## Project Description

A descriptive analysis of trends in mortality using data from the Office for National Statistics (ONS). The R code can be used to recreate the analysis described in [COVID-19 chart series](https://www.health.org.uk/news-and-comment/charts-and-infographics/deaths-from-any-cause-in-care-homes-have-increased-by-99-per-cent) and the Stata code can be used to recreate the analysis in our [COVID-19 chart series](https://www.health.org.uk/news-and-comment/charts-and-infographics/weekly-deaths-are-significantly-higher-than-in-the-same-period) analysis showing excess mortality.


## Data source

This project uses publically available data that can be downloaded from the [ONS website](https://www.ons.gov.uk/peoplepopulationandcommunity/birthsdeathsandmarriages/deaths/datasets/weeklyprovisionalfiguresondeathsregisteredinenglandandwales). The data were released with an [Open Government Licence](http://www.nationalarchives.gov.uk/doc/open-government-licence/version/3/). 



## How does it work?

The R code provided downloads the data you need and cleans it. We have used the groupings provided by the ONS, summarised below.   

- Care homes includes homes for the chronic sick; nursing homes; homes for people with mental health problems and non-NHS multi function sites.
- Deaths at home are those at the usual residence of the deceased (according to the informant)‚ where this is not a communal establishment.
- Hospices include Sue Ryder Homes; Marie Curie Centres; oncology centres; voluntary hospice units; and palliative care centres.
- Hospital includes acute or community, not psychiatric.
- Other communal establishments include schools for people with learning disabilities; holiday homes and hotels; common lodging houses; aged persons’ accommodation; assessment centres; schools; convents and monasteries; nurses’ homes; university and college halls of residence; young offender institutions; secure training centres; detention centres; prisons and remand homes.
- Elsewhere includes all places not covered above such as deaths on a motorway; at the beach; climbing a mountain; walking down the street; at the cinema; at a football match; while out shopping; or in someone else's home. This category also includes people who are pronounced dead on arrival at hospital.

The do file was written with Stata version 15. To run the whole code successfully, it is necessary to download and save all of the spreadsheets from 2010 to 2020. This can be done manually or using the R code provided. Running the code cleans and appends all of the data from the tabs called “Weekly figures 20**”. The final result should include a new dataset for all years with the following variables: all deaths; 5-years average of all deaths; respiratory disease deaths; COVID-19 deaths; deaths by age groups and gender; deaths by government office regions.  

The final part of the code directly saves the data used to create the chart. 

### Requirements

The R scripts were written under R version 3.6.3 (2020-02-29) -- "Holding the windsock" and RStudio Version 1.2.5033. 
The following R packages (available on CRAN) are needed: 
* [**tidyverse**](https://www.tidyverse.org/) (1.3.0)
* [**here**](https://cran.r-project.org/web/packages/here/index.html) (0.1)
* [**glue**](https://cran.r-project.org/web/packages/glue/index.html) (1.4.0)
* **THFstyle** internal package

Functions from internal package, theme_THF() and scale_XXX_THF() can be removed or be replaced with eg theme_minimal().

The Stata code was written using Stata version 15. 

### Getting started

The 'src' folder contains

* 0_download_data.R - Download weekly mortality data since 2010
* 1_COVID_occurence_of_death.R - Clean and save data
* 2_deaths_by_place_of_occurence.R - plot data on place of death
* 3_daily_deaths_plot.R - plot daily deaths 
* 4_occupations_plot.R - plot death rates by occupation 
* ONS_deaths.do - clean mortality data over time



## Authors

* **Emma Vestesson** - [Health Foundation profile](https://www.health.org.uk/about-the-health-foundation/our-people/improvement-analytics-unit-iau/emma-vestesson) [@gummifot](https://twitter.com/gummifot) - [emmavestesson](https://github.com/emmavestesson)
* **Nadya Mihaylova** [Health Foundation profile](https://www.health.org.uk/about-the-health-foundation/our-people/healthy-lives-team/nadya-mihaylova)  [@NadyaMihaylova3](https://twitter.com/NadyaMihaylova3)


## License

This project is licensed under the [MIT License](https://github.com/HFAnalyticsLab/COVID19_ONS_mortality/blob/master/LICENSE).

## Acknowledgments

This builds on work by Zoe Turner - [Github](https://github.com/Lextuga007) [Twitter](https://twitter.com/Letxuga007). 

