***************Deaths registered weekly in England and Wales********************

//Data is downloaded from: https://www.ons.gov.uk/peoplepopulationandcommunity/birthsdeathsandmarriages/deaths/datasets/weeklyprovisionalfiguresondeathsregisteredinenglandandwales
// The data can be downloaded using the R code provided here https://github.com/HFAnalyticsLab/COVID19_ONS_mortality/blob/master/src/0_download_data.R
//All spreadsheets are renamed to "Mortality****" where **** represents the year 
//Missing values indicated as : were removed manually from spreadsheets 2011 and 2014

**************************************2010**************************************
clear all 
cd "\\pppf.org.uk\health\ODE\COVID-19\COVID19_ONS\data"
import excel "\\pppf.org.uk\health\ODE\COVID-19\COVID19_ONS\data\original data\2010Mortality.xls", sheet("Weekly Figures 2010") cellrange(A5:BA52) firstrow case(lower) allstring

//Change from string to numeric 
destring b-ba, replace

//Transpose the dataset 
xpose, clear varname
drop in 1

//Drop all missing variables 
foreach var of varlist _all {
     capture assert mi(`var')
     if !_rc {
        drop `var'
     }
}
//Rename the variables 
rename (v3-v47) (v(#)) ,addnumber

//Generate time variables 
gen year = 2010
gen week = _n

save 2010data.dta, replace 
********************************************************************************
**************************************2011**************************************
clear all 
cd "\\pppf.org.uk\health\ODE\COVID-19\COVID19_ONS\data"
import excel "\\pppf.org.uk\health\ODE\COVID-19\COVID19_ONS\data\original data\2011Mortality.xls", sheet("Weekly Figures 2011") cellrange(A4:BA53) firstrow case(lower) allstring

//Change from string to numeric 
drop if _n <4
destring b-ba, replace

//Transpose the dataset 
xpose, clear varname
drop in 1

//Drop all missing variables 
foreach var of varlist _all {
     capture assert mi(`var')
     if !_rc {
        drop `var'
     }
}
//Rename the variables 
drop v6
rename (v1-v46) (v(#)) ,addnumber

//Generate time variables 
gen year = 2011
gen week = _n

save 2011data.dta, replace 
********************************************************************************
**************************************2012**************************************
clear all 
cd "\\pppf.org.uk\health\ODE\COVID-19\COVID19_ONS\data"
import excel "\\pppf.org.uk\health\ODE\COVID-19\COVID19_ONS\data\original data\2012Mortality.xls", sheet("Weekly Figures 2012") cellrange(A5:BA53) firstrow case(lower) allstring

//Change from string to numeric 
destring b-ba, replace

//Transpose the dataset 
xpose, clear varname
drop in 1

//Drop all variables with missing values
foreach var of varlist _all {
     capture assert mi(`var')
     if !_rc {
        drop `var'
     }
}
//Rename the variables 
rename (v3-v47) (v(#)) ,addnumber

gen year = 2012
gen week = _n

save 2012data.dta, replace 
********************************************************************************
**************************************2013**************************************
clear all 
cd "\\pppf.org.uk\health\ODE\COVID-19\COVID19_ONS\data"
import excel "\\pppf.org.uk\health\ODE\COVID-19\COVID19_ONS\data\original data\2013Mortality.xls", sheet("Weekly Figures 2013") cellrange(A5:BA52) firstrow case(lower) allstring

//Change from string to numeric 
destring b-ba, replace

//Transpose the dataset 
xpose, clear varname
drop in 1

//Drop all variables with missing values
foreach var of varlist _all {
     capture assert mi(`var')
     if !_rc {
        drop `var'
     }
}
//Rename the variables 
rename (v3-v47) (v(#)) ,addnumber
//Generate time variables 
gen year = 2013
gen week = _n

save 2013data.dta, replace 
********************************************************************************
**************************************2014**************************************
clear all 
cd "\\pppf.org.uk\health\ODE\COVID-19\COVID19_ONS\data"
import excel "\\pppf.org.uk\health\ODE\COVID-19\COVID19_ONS\data\original data\2014Mortality.xls", sheet("Weekly Figures 2014") cellrange(A4:BA52) firstrow case(lower) allstring

//Change from string to numeric 
destring b-ba, replace

//Transpose the dataset 
xpose, clear varname
drop in 1

//Drop all variables with missing values
foreach var of varlist _all {
     capture assert mi(`var')
     if !_rc {
        drop `var'
     }
}
//Rename the variables 
drop v9
rename (v3-v48) (v(#)) ,addnumber
//Generate time variables 
gen year = 2014
gen week = _n

save 2014data.dta, replace 
********************************************************************************
**************************************2015**************************************
clear all 
cd "\\pppf.org.uk\health\ODE\COVID-19\COVID19_ONS\data"
import excel "\\pppf.org.uk\health\ODE\COVID-19\COVID19_ONS\data\original data\2015Mortality.xls", sheet("Weekly Figures 2015") cellrange(A5:BB52) firstrow case(lower) allstring

//Change from string to numeric 
destring b-bb, replace

//Transpose the dataset 
xpose, clear varname
drop in 1

//Drop all variables with missing values
foreach var of varlist _all {
     capture assert mi(`var')
     if !_rc {
        drop `var'
     }
}
//Rename the variables 
rename (v3-v47) (v(#)) ,addnumber
//Generate time variables 
gen year = 2015
gen week = _n

save 2015data.dta, replace 
********************************************************************************
**************************************2016**************************************
clear all 
cd "\\pppf.org.uk\health\ODE\COVID-19\COVID19_ONS\data"
import excel "\\pppf.org.uk\health\ODE\COVID-19\COVID19_ONS\data\original data\2016Mortality.xls", sheet("Weekly figures 2016") cellrange(B5:BB52) firstrow case(lower) allstring

//Change from string to numeric 
destring b-bb, replace

//Transpose the dataset 
xpose, clear varname
drop in 1

//Drop all variables with missing values
foreach var of varlist _all {
     capture assert mi(`var')
     if !_rc {
        drop `var'
     }
}
//Rename the variables 
rename (v3-v47) (v(#)) ,addnumber
//Generate time variables 
gen year = 2016
gen week = _n

save 2016data.dta, replace 
********************************************************************************
**************************************2017**************************************
clear all 
cd "\\pppf.org.uk\health\ODE\COVID-19\COVID19_ONS\data"
import excel "\\pppf.org.uk\health\ODE\COVID-19\COVID19_ONS\data\original data\2017Mortality.xls", sheet("Weekly figures 2017") cellrange(B5:BB52) firstrow case(lower) allstring

//Change from string to numeric 
destring b-bb, replace

//Transpose the dataset 
xpose, clear varname
drop in 1

//Drop all variables with missing values
foreach var of varlist _all {
     capture assert mi(`var')
     if !_rc {
        drop `var'
     }
}
//Rename the variables 
rename (v3-v47) (v(#)) ,addnumber
//Generate time variables 
gen year = 2017
gen week = _n

save 2017data.dta, replace 
********************************************************************************
**************************************2018**************************************
clear all 
cd "\\pppf.org.uk\health\ODE\COVID-19\COVID19_ONS\data"
import excel "\\pppf.org.uk\health\ODE\COVID-19\COVID19_ONS\data\original data\2018Mortality.xls", sheet("Weekly figures 2018") cellrange(B5:BB52) firstrow case(lower) allstring

//Change from string to numeric 
destring b-bb, replace

//Transpose the dataset 
xpose, clear varname
drop in 1

//Drop all variables with missing values
foreach var of varlist _all {
     capture assert mi(`var')
     if !_rc {
        drop `var'
     }
}
//Rename the variables 
rename (v3-v47) (v(#)) ,addnumber
//Generate time variables 
gen year = 2018
gen week = _n

save 2018data.dta, replace 
********************************************************************************
**************************************2019**************************************
clear all 
cd "\\pppf.org.uk\health\ODE\COVID-19\COVID19_ONS\data"
import excel "\\pppf.org.uk\health\ODE\COVID-19\COVID19_ONS\data\original data\2019Mortality.xls", sheet("Weekly figures 2019") cellrange(B5:BB52) firstrow case(lower) allstring

//Change from string to numeric 
destring b-bb, replace

//Transpose the dataset 
xpose, clear varname
drop in 1

//Drop all variables with missing values
foreach var of varlist _all {
     capture assert mi(`var')
     if !_rc {
        drop `var'
     }
}
//Rename the variables 
rename (v3-v47) (v(#)) ,addnumber
//Generate time variables 
gen year = 2019
gen week = _n

save 2019data.dta, replace 
********************************************************************************
**************************************2020**************************************
//The spreadsheet for 2020 is up to week ending 10th April 2020
clear all 
cd "\\pppf.org.uk\health\ODE\COVID-19\COVID19_ONS\data"
import excel "\\pppf.org.uk\health\ODE\COVID-19\COVID19_ONS\data\original data\2020Mortality.xlsx", sheet("Weekly figures 2020") cellrange(B6:BB96) firstrow case(lower) allstring

//Drop additional data 
drop in 7
drop in 8 

//Change from string to numeric 
destring b-bb, replace

//Transpose the dataset 
xpose, clear varname
drop in 1

//Drop all variables with missing values
foreach var of varlist _all {
     capture assert mi(`var')
     if !_rc {
        drop `var'
     }
}

//Move the covid-19 variable to the end 
move v11 v88
rename v11 covid19 
//Rename the variables 
rename (v3-v88) (v(#)) ,addnumber

gen age1 = v4
egen age2 = rowtotal(v5-v7)
egen age3 = rowtotal(v8-v13)
egen age4 = rowtotal(v14-v17)
egen age5 = rowtotal(v18-v19)
egen age6 = rowtotal(v20-v21)
egen age7 = rowtotal(v22-v23)

gen mage1 = v24
egen mage2 = rowtotal(v25-v27)
egen mage3 = rowtotal(v28-v33)
egen mage4 = rowtotal(v34-v37)
egen mage5 = rowtotal(v38-v39)
egen mage6 = rowtotal(v40-v41)
egen mage7 = rowtotal(v42-v43)

gen fage1 = v44
egen fage2 = rowtotal(v45-v47)
egen fage3 = rowtotal(v48-v53)
egen fage4 = rowtotal(v54-v57)
egen fage5 = rowtotal(v58-v59)
egen fage6 = rowtotal(v60-v61)
egen fage7 = rowtotal(v62-v63)

//Drop variables
drop v4-v63
order age1-fage7, before(v64)
rename (v1-v73) (v(#)) ,addnumber

//Generate time variables 
gen year = 2020
gen week = _n

save 2020data.dta, replace 
********************************************************************************
********************************************************************************
********************************************************************************
//Appending the datasets 
clear all 
cd "\\pppf.org.uk\health\ODE\COVID-19\COVID19_ONS\data"
use 2010data.dta, clear
append using 2011data.dta
append using 2012data.dta
append using 2013data.dta
append using 2014data.dta
append using 2015data.dta
append using 2016data.dta
append using 2017data.dta
append using 2018data.dta
append using 2019data.dta
append using 2020data.dta

//Set the data to weekly 
gen date=yw(year,week)
tsset date, weekly 
//There are yeras with 53 weeks 
sort year week
drop _varname

//Rename the age group variables
rename v1 deaths
label variable deaths "Total deaths, all ages"
rename v2 avedeaths
label variable avedeaths "Total deaths: average of corresponding week over the previous 5 years"
rename v3 resp
label variable resp "All respiratory disease"

rename v4 agegr1
label variable agegr1 "Under 1 years"
rename v5 agegr2
label variable agegr2 "01-14"
rename v6 agegr3
label variable agegr3 "15-44"
rename v7 agegr4
label variable agegr4 "45-64"
rename v8 agegr5
label variable agegr5 "65-74"
rename v9 agegr6
label variable agegr6 "75-84"
rename v10 agegr7
label variable agegr7 "85+"

rename v11 magegr1
label variable magegr1 "Males under 1 years"
rename v12 magegr2
label variable magegr2 "Males 01-14"
rename v13 magegr3
label variable magegr3 "Males 15-44"
rename v14 magegr4
label variable magegr4 "Males 45-64"
rename v15 magegr5
label variable magegr5 "Males 65-74"
rename v16 magegr6
label variable magegr6 "Males 75-84"
rename v17 magegr7
label variable magegr7 "Males 85+"

rename v18 fagegr1
label variable fagegr1 "Females under 1 years"
rename v19 fagegr2
label variable fagegr2 "Females 01-14"
rename v20 fagegr3
label variable fagegr3 "Females 15-44"
rename v21 fagegr4
label variable fagegr4 "Females 45-64"
rename v22 fagegr5
label variable fagegr5 "Females 65-74"
rename v23 fagegr6
label variable fagegr6 "Females 75-84"
rename v24 fagegr7
label variable fagegr7 "Females 85+"

rename v25 ne
label variable ne "North East"
rename v26 nw
label variable nw "North West"
rename v27 yh
label variable yh "Yorkshire and The Humber"
rename v28 em
label variable em "East Midlands"
rename v29 wm
label variable wm "West Midlands"
rename v30 ee
label variable ee "East of England"
rename v31 london
label variable london "London"
rename v32 se
label variable se "South East"
rename v33 sw
label variable sw "South West"
rename v34 wales
label variable wales "Wales"

//Exporting the dataset
move week deaths
move year week
export excel using "Dataset", sheet("All deaths") sheetreplace firstrow(variables) datestring("%tw")

save 2010-2020data.dta, replace 

/////////////////////////////Creating the chart////////////////////////////////
clear all 
cd "\\pppf.org.uk\health\ODE\COVID-19\COVID19_ONS\data"
use 2010-2020data.dta

//Generate a variable for all deaths excluding covid-19
gen deaths_exclcovid = deaths - covid19 
label variable deaths_exclcovid "All deaths excluding COVID-19"

//Export data for all deaths and covid-19 deaths 
collapse deaths_exclcovid deaths if year==2020 & week<=15, by(year week) 

//Export data for the max, min and avearge 
clear all
use 2010-2020data.dta
collapse deaths if year>=2015 & year<=2019, by(year week) 
reshape wide deaths, i(week) j(year)
 
egen highest=rowmax(deaths*)
egen lowest=rowmin(deaths*)
egen mean=rowmean(deaths*)


