# ONS mortality

#### Project Status: [In progess]

## Project Description

A descriptive analysis of trends in mortality using data from the Office for National Statistics. The code can be used to recreate the analysis described in [COVID-19 chart series](https://www.health.org.uk/news-and-comment/charts-and-infographics/deaths-from-any-cause-in-care-homes-have-increased-by-99-per-cent).

## Data source

This project uses publically available data that can be downloaded from the [ONS website](https://www.ons.gov.uk/peoplepopulationandcommunity/birthsdeathsandmarriages/deaths/datasets/weeklyprovisionalfiguresondeathsregisteredinenglandandwales). The data were released with an [Open Government Licence](http://www.nationalarchives.gov.uk/doc/open-government-licence/version/3/). 


## How does it work?

The code provided downloads the data you need.

### Requirements

These scripts were written under R version 3.6.3 (2020-02-29) -- "Holding the windsock" and RStudio Version 1.2.5033. 
The following R packages (available on CRAN) are needed: 
* [**tidyverse**](https://www.tidyverse.org/) (1.3.0)
* [**here**](https://cran.r-project.org/web/packages/here/index.html) (0.1)
* **THFstyle** internal package
Functions from internal package, theme_THF() and scale_XXX_THF() can be removed or be replaced with eg theme_minimal().


### Getting started

The 'src' folder contains

* 0_download_data.R - Download weekly mortality data since 2010
* 1_COVID_occurence_of_death.R - Clean and plot data on place of death


## Authors

* **Emma Vestesson** - [@gummifot](https://twitter.com/gummifot) - [emmavestesson](https://github.com/emmavestesson)


## License

This project is licensed under the [MIT License](https://github.com/HFAnalyticsLab/COVID19_ONS_mortality/blob/master/LICENSE).

## Acknowledgments

This builds on work by Zoe Turner - [Github](https://github.com/Lextuga007) [Twitter](https://twitter.com/Letxuga007). 

