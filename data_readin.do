*Data Construction 
**WIC Data
*Importing # of pregnant women outcome for all years
forvalues j = 2017/2023{
	import excel using "FY`j'WIC", sheet("Pregnant Women Participating") clear firstrow
	statastates, name(state)
	rename state_fips statefips
	drop if statefips == .
	drop _merge
	gen FY = `j'
	reshape long preg_ , i(state) j(month)
	save FY`j'_preg.dta, replace
}

import excel using "FY2024WIC", sheet("Pregnant Women Participating") clear firstrow
	statastates, name(state)
	rename state_fips statefips
	drop if statefips == .
	drop _merge
	gen FY = 2024
	reshape long preg_ , i(state) j(month)
	save FY2024_preg.dta, replace
	
use FY2017_preg.dta, clear
forvalues j = 2018/2024{
	append using FY`j'_preg.dta
}

gen year = FY
replace year = FY - 1 if month == 10 | month == 11 | month == 12

drop preg_FY*
rename preg_ preg
drop L M

save preg_month.dta, replace

*Importing # of total women outcome for all years
forvalues j = 2017/2023{
	import excel using "FY`j'WIC", sheet("Total Women") clear firstrow
	statastates, name(state)
	rename state_fips statefips
	drop if statefips == .
	drop _merge
	gen FY = `j'
	reshape long women_, i(state) j(month)
	save FY`j'_women.dta, replace
}

import excel using "FY2024WIC", sheet("Total Women") clear firstrow
	statastates, name(state)
	rename state_fips statefips
	drop if statefips == .
	drop _merge
	gen FY = 2024
	reshape long women_, i(state) j(month)
	save FY2024_women.dta, replace

use FY2017_women.dta, clear
forvalues j = 2018/2024{
	append using FY`j'_women.dta
}

gen year = FY
replace year = FY - 1 if month == 10 | month == 11 | month == 12

drop women_FY*
rename women_ women
drop L M

save women_month.dta, replace

*Importing # of breastfeeding women outcome for all years
forvalues j = 2017/2023{
	import excel using "FY`j'WIC", sheet("Total Breastfeeding Women") clear firstrow
	statastates, name(state)
	rename state_fips statefips
	drop if statefips == .
	drop _merge
	gen FY = `j'
	reshape long breast_, i(state) j(month)
	save FY`j'_breast.dta, replace
}

import excel using "FY2024WIC", sheet("Total Breastfeeding Women") clear firstrow
	statastates, name(state)
	rename state_fips statefips
	drop if statefips == .
	drop _merge
	gen FY = 2024
	reshape long breast_, i(state) j(month)
	save FY2024_breast.dta, replace

use FY2017_breast.dta, clear
forvalues j = 2018/2024{
	append using FY`j'_breast.dta
}

gen year = FY
replace year = FY - 1 if month == 10 | month == 11 | month == 12

drop breast_FY*
rename breast_ breast

save breast_month.dta, replace

*Importing # of post-partum women outcome for all years
forvalues j = 2017/2023{
	import excel using "FY`j'WIC", sheet("Postpartum Women Participating") clear firstrow
	statastates, name(state)
	rename state_fips statefips
	drop if statefips == .
	drop _merge
	gen FY = `j'
	reshape long post_, i(state) j(month)
	save FY`j'_post.dta, replace
}

import excel using "FY2024WIC", sheet("Postpartum Women Participating") clear firstrow
	statastates, name(state)
	rename state_fips statefips
	drop if statefips == .
	drop _merge
	gen FY = 2024
	reshape long post_, i(state) j(month)
	save FY2024_post.dta, replace
use FY2017_post.dta, clear
forvalues j = 2018/2024{
	append using FY`j'_post.dta
}

gen year = FY
replace year = FY - 1 if month == 10 | month == 11 | month == 12

drop post_FY*
rename post_ post
drop L M

save post_month.dta, replace

*Importing # of total infants outcome for all years
forvalues j = 2017/2023{
	import excel using "FY`j'WIC", sheet("Total Infants") clear firstrow
	statastates, name(state)
	rename state_fips statefips
	drop if statefips == .
	drop _merge
	gen FY = `j'
	reshape long infant_, i(state) j(month)
	save FY`j'_infant.dta, replace
}

import excel using "FY2024WIC", sheet("Total Infants") clear firstrow
	statastates, name(state)
	rename state_fips statefips
	drop if statefips == .
	drop _merge
	gen FY = 2024
	reshape long infant_, i(state) j(month)
	save FY2024_infant.dta, replace
	
use FY2017_infant.dta, clear
forvalues j = 2018/2024{
	append using FY`j'_infant.dta
}

gen year = FY
replace year = FY - 1 if month == 10 | month == 11 | month == 12

drop infant_FY*
rename infant_ infant
drop L M

save infant_month.dta, replace

*Importing # of infants fully breastfed outcome for all years
forvalues j = 2017/2023{
	import excel using "FY`j'WIC", sheet("Infants Fully Breastfed") clear firstrow
	statastates, name(state)
	rename state_fips statefips
	drop if statefips == .
	drop _merge
	gen FY = `j'
	reshape long infantfb_, i(state) j(month)
	save FY`j'_infantfb.dta, replace
}

import excel using "FY2024WIC", sheet("Infants Fully Breastfed") clear firstrow
	statastates, name(state)
	rename state_fips statefips
	drop if statefips == .
	drop _merge
	gen FY = 2024
	reshape long infantfb_, i(state) j(month)
	save FY2024_infantfb.dta, replace
	
use FY2017_infantfb.dta, clear
forvalues j = 2018/2024{
	append using FY`j'_infantfb.dta
}

gen year = FY
replace year = FY - 1 if month == 10 | month == 11 | month == 12

drop infantfb_FY*
rename infantfb_ infantfb

save infantfb_month.dta, replace

*Importing # of infants partially breastfed outcome for all years
forvalues j = 2017/2023{
	import excel using "FY`j'WIC", sheet("Infants Partially Breastfed") clear firstrow
	statastates, name(state)
	rename state_fips statefips
	drop if statefips == .
	drop _merge
	gen FY = `j'
	reshape long infantpb_, i(state) j(month)
	save FY`j'_infantpb.dta, replace
}

import excel using "FY2024WIC", sheet("Infants Partially Breastfed") clear firstrow
	statastates, name(state)
	rename state_fips statefips
	drop if statefips == .
	drop _merge
	gen FY = 2024
	reshape long infantpb_, i(state) j(month)
	save FY2024_infantpb.dta, replace
	
use FY2017_infantpb.dta, clear
forvalues j = 2018/2024{
	append using FY`j'_infantpb.dta
}

gen year = FY
replace year = FY - 1 if month == 10 | month == 11 | month == 12

drop infantpb_FY*
rename infantpb_ infantpb

save infantpb_month.dta, replace

*Importing # of infants formula fed outcome for all years
forvalues j = 2017/2023{
	import excel using "FY`j'WIC", sheet("Infants Fully Formula-fed") clear firstrow
	statastates, name(state)
	rename state_fips statefips
	drop if statefips == .
	drop _merge
	gen FY = `j'
	reshape long infantf_, i(state) j(month)
	save FY`j'_infantf.dta, replace
}

import excel using "FY2024WIC", sheet("Infants Fully Formula-fed") clear firstrow
	statastates, name(state)
	rename state_fips statefips
	drop if statefips == .
	drop _merge
	gen FY = 2024
	reshape long infantf_, i(state) j(month)
	save FY2024_infantf.dta, replace
	
use FY2017_infantf.dta, clear
forvalues j = 2018/2024{
	append using FY`j'_infantf.dta
}

gen year = FY
replace year = FY - 1 if month == 10 | month == 11 | month == 12

drop infantf_FY*
rename infantf_ infantf

save infantf_month.dta, replace

*Importing # of total children participating outcome for all years
forvalues j = 2017/2023{
	import excel using "FY`j'WIC", sheet("Children Participating") clear firstrow
	statastates, name(state)
	rename state_fips statefips
	drop if statefips == .
	drop _merge
	gen FY = `j'
	reshape long child_, i(state) j(month)
	save FY`j'_child.dta, replace
}

import excel using "FY2024WIC", sheet("Children Participating") clear firstrow
	statastates, name(state)
	rename state_fips statefips
	drop if statefips == .
	drop _merge
	gen FY = 2024
	reshape long child_, i(state) j(month)
	save FY2024_child.dta, replace

use FY2017_child.dta, clear
forvalues j = 2018/2024{
	append using FY`j'_child.dta
}

gen year = FY
replace year = FY - 1 if month == 10 | month == 11 | month == 12

drop child_FY*
rename child_ child
drop L M

save child_month.dta, replace

*Importing # of total participants outcome for all years
forvalues j = 2017/2023{
	import excel using "FY`j'WIC", sheet("Total Number of Participants") clear firstrow
	statastates, name(state)
	rename state_fips statefips
	drop if statefips == .
	drop _merge
	gen FY = `j'
	reshape long total_, i(state) j(month)
	save FY`j'_total.dta, replace
}

import excel using "FY2024WIC", sheet("Total Number of Participants") clear firstrow
	statastates, name(state)
	rename state_fips statefips
	drop if statefips == .
	drop _merge
	gen FY = 2024
	reshape long total_, i(state) j(month)
	save FY2024_total.dta, replace

use FY2017_total.dta, clear
forvalues j = 2018/2024{
	append using FY`j'_total.dta
}

gen year = FY
replace year = FY - 1 if month == 10 | month == 11 | month == 12

drop total_FY*
rename total_ total
drop L M

save total_month.dta, replace

*Merging WIC data together
use preg_month.dta, clear
merge 1:1 state year month using women_month.dta
drop _*
merge 1:1 state year month using infant_month.dta
drop _*
merge 1:1 state year month using child_month.dta
drop _*
merge 1:1 state year month using total_month.dta
drop _*
merge 1:1 state year month using breast_month.dta
drop _*
merge 1:1 state year month using post_month.dta
drop _*
merge 1:1 state year month using infantfb_month.dta
drop _*
merge 1:1 state year month using infantpb_month.dta
drop _*
merge 1:1 state year month using infantf_month.dta
drop _*

replace state = strproper(state)

save WIC_month.dta, replace


**Birth Data

*Importing total births 2017-2023
import excel using "births_17-23_monthly", sheet("total") clear firstrow
save births_total_1723_monthly.dta, replace

*Importing births by education 2017-2023
import excel using "births_17-23_monthly", sheet("educ") clear firstrow
	drop if educ_code == "Unk" | educ_code == "NR" | educ_code == "Exc"
	destring educ_code, replace
	drop if educ_code == .
	recode educ_code (1=1) (2=1) (3=2) (4=3) (5=3) (6=4) (7=5) (8=5)
	replace births = "." if births == "Suppressed"
	destring births, replace
	rename births births_educ
	collapse (sum) births_educ, by(state statefips year month_code educ_code)
	reshape wide births_educ, i(statefips state year month_code) j(educ_code)
	rename (births_educ1 births_educ2 births_educ3 births_educ4 births_educ5) (births_lesshs births_hs births_somecollege births_bach births_grad)
	save births_educ_1723_monthly.dta, replace
	
*Importing births by payment 2017-2023	
import excel using "births_17-23_monthly", sheet("pay") clear firstrow
	rename births births_pay
	drop if pay_code == 9
	replace births_pay = "." if births_pay == "Suppressed"
	destring births_pay, replace
	drop pay_source
	reshape wide births_pay, i(statefips state year month_code) j(pay_code)
	rename (births_pay1 births_pay2 births_pay3 births_pay4) (births_medicaid births_insurance births_self births_other)
	save births_pay_1723_monthly.dta, replace
	
*Importing births - wic 2017-2023	
import excel using "births_17-23_monthly", sheet("wic") clear firstrow
	rename births births_wic
	drop if wic_code == 9
	replace births_wic = "." if births_wic == "Suppressed"
	destring births_wic, replace
	drop wic
	reshape wide births_wic, i(statefips state year month_code) j(wic_code)
	rename (births_wic1 births_wic2) (births_wic births_nowic)
	save births_wic_1723_monthly.dta, replace

*Merging birth datasets
use births_total_1723_monthly.dta, clear
merge 1:1 state year month_code using births_educ_1723_monthly.dta
drop _*
merge 1:1 state year month_code using births_pay_1723_monthly.dta
drop _*
merge 1:1 state year month_code using births_wic_1723_monthly.dta
drop _*

drop month
rename month_code month

save births_monthly.dta, replace

*Merging births and WIC data
use births_monthly.dta, clear
merge 1:1 state year month statefips using WIC_month.dta
rename births births_total
drop if _merge != 3 
drop _*

save births_WIC_monthly.dta, replace


**Importing state population
*Importing female population by age 2020-22
import excel using "population_20-22", sheet("all_female") clear firstrow
	replace fiveyearfemale = "1" if fiveyearfemale == "15-19"
	replace fiveyearfemale = "2" if fiveyearfemale == "20-24"
	replace fiveyearfemale = "3" if fiveyearfemale == "25-29"
	replace fiveyearfemale = "4" if fiveyearfemale == "30-34"
	replace fiveyearfemale = "5" if fiveyearfemale == "35-39"
	replace fiveyearfemale = "6" if fiveyearfemale == "40-44"
	reshape wide population, i(statefip state year) j(fiveyearfemale) string
	rename (population1 population2 population3 population4 population5 population6) (pop_female_1519 pop_female_2024 pop_female_2529 pop_female_3034 pop_female_3539 pop_female_4044)
	egen pop_female = rowtotal(pop_female_1519 pop_female_2024 pop_female_2529 pop_female_3034 pop_female_3539 pop_female_4044)

lab var pop_female_1519 "Population female 15-19"
lab var pop_female_2024 "Population female 20-24"
lab var pop_female_2529 "Population female 25-29"
lab var pop_female_3034 "Population female 30-34"
lab var pop_female_3539 "Population female 35-39"
lab var pop_female_4044 "Population female 40-44"
lab var pop_female "Population female 15-44"

save population_female2022.dta, replace

*Importing infant/children 2020-22
import excel using "population_20-22", sheet("children") clear firstrow
	gen category = .
	replace category = 1 if age_code == 0 | age_code == 1
	replace category = 2 if age_code == 2 | age_code == 3 | age_code == 4
	collapse (sum) population, by(state statefips year category)
	reshape wide population, i(statefip state year) j(category)
	rename (population1 population2) (pop_infant pop_children)

lab var pop_infant "Population infants 0-1"
lab var pop_children "Population children 2-4"

save pop_children2022.dta, replace

*Importing female population by race 2020-22
import excel using "population_20-22", sheet("race_female") clear firstrow
	replace race_code = "1" if race_code == "1002-5"
	replace race_code = "2" if race_code == "A"
	replace race_code = "3" if race_code == "2054-5"
	replace race_code = "4" if race_code == "NHOPI"
	replace race_code = "5" if race_code == "2106-3"
	replace race_code = "6" if race_code == "M"
	drop race
	reshape wide population, i(statefip state year) j(race_code) string
	rename (population1 population2 population3 population4 population5 population6) (pop_female_aian pop_female_asian pop_female_black pop_female_nhopi pop_female_white pop_female_multi)


lab var pop_female_aian "Population female american indian/alaska native"
lab var pop_female_asian "Population female asian"
lab var pop_female_black "Population female black"
lab var pop_female_nhopi "Population female native hawaiian/other pacific islander"
lab var pop_female_white "Population female white"
lab var pop_female_multi "Population female multi-race"

save pop_race2022.dta, replace

*Importing hispanic population 2020-22
import excel using "population_20-22", sheet("hispanic") clear firstrow
	replace ethnicity_code = "1" if ethnicity_code == "2135-2"
	replace ethnicity_code = "2" if ethnicity_code == "2186-5"
	drop ethnicity 
	reshape wide population, i(statefips state year) j(ethnicity_code) string
	rename (population1 population2) (pop_female_hispanic pop_female_nonhispanic)

lab var pop_female_hispanic "Population hispanic"
lab var pop_female_nonhispanic "Population non-hispanic"

save pop_hispanic2022.dta, replace

*Importing total population 2020-22
import excel using "population_20-22", sheet("total") clear firstrow
rename population pop_total

lab var pop_total "Population total"

save pop_total2022.dta, replace

*Merging population variables 2020-22
use population_female2022.dta, clear
merge 1:1 state statefips year using pop_children2022.dta
drop _*
merge 1:1 state statefips year using pop_race2022.dta
drop _*
merge 1:1 state statefips year using pop_hispanic2022.dta
drop _*
merge 1:1 state statefips year using pop_total2022.dta
drop _*

save population_2022.dta, replace

*Importing female population by age 2017-2019
import excel using "population_17-19", sheet("female_all") clear firstrow
	replace fiveyearfemale = "1" if fiveyearfemale == "15-19"
	replace fiveyearfemale = "2" if fiveyearfemale == "20-24"
	replace fiveyearfemale = "3" if fiveyearfemale == "25-29"
	replace fiveyearfemale = "4" if fiveyearfemale == "30-34"
	replace fiveyearfemale = "5" if fiveyearfemale == "35-39"
	replace fiveyearfemale = "6" if fiveyearfemale == "40-44"
	reshape wide population, i(statefip state year) j(fiveyearfemale) string
	rename (population1 population2 population3 population4 population5 population6) (pop_female_1519 pop_female_2024 pop_female_2529 pop_female_3034 pop_female_3539 pop_female_4044)
	egen pop_female = rowtotal(pop_female_1519 pop_female_2024 pop_female_2529 pop_female_3034 pop_female_3539 pop_female_4044)

lab var pop_female_1519 "Population female 15-19"
lab var pop_female_2024 "Population female 20-24"
lab var pop_female_2529 "Population female 25-29"
lab var pop_female_3034 "Population female 30-34"
lab var pop_female_3539 "Population female 35-39"
lab var pop_female_4044 "Population female 40-44"
lab var pop_female "Population female 15-44"

save pop_female_1719.dta, replace

*Importing infants/children 2017-2019
import excel using "population_17-19", sheet("children") clear firstrow
	gen category = .
	replace category = 1 if age_code == 0 | age_code == 1
	replace category = 2 if age_code == 2 | age_code == 3 | age_code == 4
	collapse (sum) population, by(state statefips year category)
	reshape wide population, i(statefip state year) j(category)
	rename (population1 population2) (pop_infant pop_children)

lab var pop_infant "Population infants 0-1"
lab var pop_children "Population children 2-4"

save pop_children_1719.dta, replace

*Importing female population by race 2017-2019
import excel using "population_17-19", sheet("female_race") clear firstrow
	replace race_code = "1" if race_code == "1002-5"
	replace race_code = "2" if race_code == "A"
	replace race_code = "3" if race_code == "2054-5"
	replace race_code = "4" if race_code == "NHOPI"
	replace race_code = "5" if race_code == "2106-3"
	replace race_code = "6" if race_code == "M"
	drop race
	rename States state
	reshape wide population, i(statefip state year) j(race_code) string
	rename (population1 population2 population3 population4 population5 population6) (pop_female_aian pop_female_asian pop_female_black pop_female_nhopi pop_female_white pop_female_multi)

lab var pop_female_aian "Population female american indian/alaska native"
lab var pop_female_asian "Population female asian"
lab var pop_female_black "Population female black"
lab var pop_female_nhopi "Population female native hawaiian/other pacific islander"
lab var pop_female_white "Population female white"
lab var pop_female_multi "Population female multi-race"

save pop_race_1719.dta, replace

*Importing hispanic population 2017-2019
import excel using "population_17-19", sheet("female_hispanic") clear firstrow
	replace ethnicity_code = "1" if ethnicity_code == "2135-2"
	replace ethnicity_code = "2" if ethnicity_code == "2186-5"
	drop ethnicity 
	reshape wide population, i(statefips state year) j(ethnicity_code) string
	rename (population1 population2) (pop_female_hispanic pop_female_nonhispanic)

lab var pop_female_hispanic "Population hispanic"
lab var pop_female_nonhispanic "Population non-hispanic"

save pop_hispanic_1719.dta, replace

*Importing total population 2017-19
import excel using "population_17-19", sheet("total") clear firstrow
rename population pop_total

lab var pop_total "Population total"

save pop_total_1719.dta, replace

*Merging population variables 2017-19
use pop_female_1719.dta, clear
merge 1:1 state statefips year using pop_children_1719.dta
drop _*
merge 1:1 state statefips year using pop_race_1719.dta
drop _*
merge 1:1 state statefips year using pop_hispanic_1719.dta
drop _*
merge 1:1 state statefips year using pop_total_1719.dta
drop _*

save population_1719.dta, replace

*Importing female population by age 2023
import excel using "population_23_raw", clear firstrow
	drop if sex == 0 | sex == 1 //dropping total and male
	drop if origin == 1 | origin == 2 //dropping so obs are all hispanic and non-hispanic
	drop if age <15 | age >44
	gen fiveyearfemale = "."
	replace fiveyearfemale = "1" if age >= 15 & age <=19
	replace fiveyearfemale = "2" if age >= 20 & age <=24
	replace fiveyearfemale = "3" if age >= 25 & age <=29
	replace fiveyearfemale = "4" if age >= 30 & age <=34
	replace fiveyearfemale = "5" if age >= 35 & age <=39
	replace fiveyearfemale = "6" if age >= 40 & age <=44
	drop origin sex
	egen population = total(pop_2023), by(statefips state fiveyearfemale)
	drop if age != 15 & age !=20 & age !=25 & age !=30 & age !=35 & age !=40
	drop if race != 1
	drop race age pop_2023
	reshape wide population, i(statefip state) j(fiveyearfemale) string
	rename (population1 population2 population3 population4 population5 population6) (pop_female_1519 pop_female_2024 pop_female_2529 pop_female_3034 pop_female_3539 pop_female_4044)
	egen pop_female = rowtotal(pop_female_1519 pop_female_2024 pop_female_2529 pop_female_3034 pop_female_3539 pop_female_4044)
	gen year = 2023

lab var pop_female_1519 "Population female 15-19"
lab var pop_female_2024 "Population female 20-24"
lab var pop_female_2529 "Population female 25-29"
lab var pop_female_3034 "Population female 30-34"
lab var pop_female_3539 "Population female 35-39"
lab var pop_female_4044 "Population female 40-44"
lab var pop_female "Population female 15-44"

save pop_female23.dta, replace

*Importing infants/children 2023
import excel using "population_23_raw", clear firstrow
	drop if sex == 1 | sex == 2 //keeping just total
	drop if origin == 1 | origin == 2 //keeping just total
	drop if age > 4
	gen category = .
	replace category = 1 if age == 0 | age == 1
	replace category = 2 if age >=2 & age <=4
	drop sex origin
	egen population = total(pop_2023), by(statefips state category)
	drop if age != 0 & age != 2
	drop if race != 1
	drop age race pop_2023
	reshape wide population, i(statefip state) j(category) 
	rename (population1 population2) (pop_infant pop_children)
	gen year = 2023

lab var pop_infant "Population infants 0-1"
lab var pop_children "Population children 2-4"

save pop_children23.dta, replace

*Importing female population by race 2023
import excel using "population_23_raw", clear firstrow
	drop if sex == 0 | sex == 1 //dropping total and male
	drop if origin == 0 | origin == 2 //keeping just non-hispanic
	drop if age <15 | age >44
	drop sex origin
	egen population = total(pop_2023), by(statefips state race)
	drop if age != 15
	drop age pop_2023
	reshape wide population, i(statefip state) j(race)
	rename (population3 population4 population2 population5 population1 population6) (pop_female_aian pop_female_asian pop_female_black pop_female_nhopi pop_female_white pop_female_multi)
	order state statefips pop_female_aian pop_female_asian pop_female_black pop_female_nhopi pop_female_white pop_female_multi
	gen year = 2023

lab var pop_female_aian "Population female american indian/alaska native"
lab var pop_female_asian "Population female asian"
lab var pop_female_black "Population female black"
lab var pop_female_nhopi "Population female native hawaiian/other pacific islander"
lab var pop_female_white "Population female white"
lab var pop_female_multi "Population female multi-race"

save pop_race23.dta, replace

*Importing hispanic population 2023
import excel using "population_23_raw", clear firstrow
	drop if sex == 0 | sex == 1 //dropping total and male
	drop if origin == 0 //dropping total hispanic
	drop if age<15 | age >44
	egen population = total(pop_2023), by(statefips state origin)
	drop if age !=15 | race !=1
	drop age pop_2023 sex race
	reshape wide population, i(statefip state) j(origin)
	rename (population1 population2) (pop_female_hispanic pop_female_nonhispanic)
	gen year = 2023

lab var pop_female_hispanic "Population female hispanic"
lab var pop_female_nonhispanic "Population female nonhispanic"

save pop_hispanic23.dta, replace

*Importing total population 2023
import excel using "population_23_raw", clear firstrow
	drop if sex != 0 //only keeping total
	drop if origin !=0 //only keeping total
	egen pop_total = total(pop_2023), by(statefips state)
	drop if age!= 0 | race !=1
	drop sex origin race age pop_2023
	gen year = 2023

lab var pop_total "Population total"

save pop_total23.dta, replace

*Merging population variables 2023
use pop_female23.dta, clear
merge 1:1 state statefips year using pop_children23.dta
drop _*
merge 1:1 state statefips year using pop_race23.dta
drop _*
merge 1:1 state statefips year using pop_hispanic23.dta
drop _*
merge 1:1 state statefips year using pop_total23.dta
drop _*

save population_23.dta, replace

*Appending population 
use population_2022.dta, clear
append using population_1719.dta
append using population_23.dta
sort state statefips year

save population_1723.dta, replace

**Merging in population data
use births_WIC_monthly.dta, clear
merge m:m state statefips year using population_1723.dta
drop if _merge != 3
drop _*

sort state statefips year month

save births_WIC_monthly.dta, replace

**Importing state unemployment rates
import excel using "annual_state_unemployment", sheet("Sheet1") clear firstrow 
	rename DATE statefips
	foreach j of numlist 1/9{
		replace statefips = "`j'" if statefips == "LAUST0`j'0000000000003A" 
	}
	foreach j of numlist 10/56{
		replace statefips = "`j'" if statefips == "LAUST`j'0000000000003A" 
	}
	destring statefips, replace
	save unemprates.dta, replace


**Merge in state unemployment rates
use births_WIC_monthly.dta, clear
merge m:1 statefips using unemprates.dta
gen unemp_rate = .

forvalues j = 2017/2023{
		replace unemp_rate = ur_`j' if year == `j'
}

drop _* ur*
drop if statefips == 11

save births_WIC_monthly.dta, replace

**Calculating birth rates
gen birthrate_total = (births_total / pop_female) * 1000
gen birthrate_LessHS = (births_lesshs / pop_female) * 1000
gen birthrate_HS = (births_hs / pop_female) * 1000
gen birthrate_SomeCollege = (births_somecollege / pop_female) * 1000
gen birthrate_Bach = (births_bach / pop_female) * 1000
gen birthrate_Grad = (births_grad / pop_female) * 1000
gen birthrate_medicaid = (births_medicaid / pop_female) * 1000
gen birthrate_insurance = (births_insurance / pop_female) * 1000
gen birthrate_self = (births_self / pop_female) * 1000
gen birthrate_other = (births_other / pop_female) * 1000
gen birthrate_wic = (births_wic / pop_female) * 1000
gen birthrate_nowic = (births_nowic / pop_female) * 1000

save births_WIC_monthly.dta, replace

**Merging in abortion data
use births_WIC_monthly.dta, clear
merge m:m statefips using abortionpolicies.dta
drop if _merge != 3
drop _*
save births_WIC_monthly.dta, replace

**Generating DID variables
gen post_Dobbs = (year> 2022)
gen product_year = fullban*post_Dobbs

lab var product_year "Post Total Ban Implementation"

save full_data_monthly.dta, replace

**Generating control variables
gen share_black = pop_female_black / pop_female //non-hispanic black %
gen share_white = pop_female_white / pop_female //non-hispanic white %
gen share_asian = pop_female_asian / pop_female //non-hispanic asian %
gen share_hispanic = pop_female_hispanic / pop_female //hispanic %

gen formula_shortage = (year >=2022 & month >=2)

lab var share_black "15-44 female non-Hispanic Black (%)"
lab var share_white "15-44 female non-Hispanic White (%)"
lab var share_asian "15-44 female non-Hispanic Asian (%)"
lab var share_hispanic "15-44 female Hispanic (%)"
lab var formula_shortage "Infant formula shortage"

lab var unemp_rate "State Unemployment Rate"

save full_data_monthly.dta, replace

***Logged WIC outcomes
gen ln_preg = ln(preg)
gen ln_women = ln(women)
gen ln_breast = ln(breast)
gen ln_post = ln(post)
gen ln_infant = ln(infant)
gen ln_children = ln(child)
gen ln_total = ln(total)
gen ln_infantf = ln(infantf)
gen ln_infantfb = ln(infantfb)
gen ln_infantpb = ln(infantpb)

gen monthyear = ym(year, month)

gen product_month2 = fullban * post_Dobbs
lab var product_month2 "Post Total Ban Implementation"

***Controlling for state-specific seasonality - residuals
use full_data_monthly.dta, clear

foreach j of varlist birthrate_total birthrate_LessHS birthrate_HS birthrate_SomeCollege birthrate_Bach birthrate_Grad ln_preg ln_women ln_breast ln_post ln_infant ln_children ln_total ln_infantf ln_infantfb ln_infantpb{
	gen `j'_d = .
	levelsof statefips, local(levels)
	foreach s of local levels{
		reg `j' i.month if statefips == `s'
		predict `j'_d_`s' if statefips == `s', resid
		replace `j'_d = `j'_d_`s' if statefips == `s'
		drop `j'_d_`s'
	}
}

**Robustness check variables	
import excel additional_controls, sheet("Sheet1") firstrow clear

rename statefip statefips
save additional_controls.dta, replace

use full_data_monthly.dta, clear

merge m:m statefips using additional_controls.dta
	drop if _merge == 2
	drop _merge
	
gen Medicaid_exp_year = year(Medicaid_exp)	
gen Medicaid_exp_month = month(Medicaid_exp)
gen expand_medicaid = (year >= Medicaid_exp_year & month>= Medicaid_exp_month)
	
save full_data_monthly.dta, replace


