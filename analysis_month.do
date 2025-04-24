ssc install sdid

use full_data_monthly.dta, clear

xtset statefips monthyear
drop if statefips == 11


***Table 1 Summary Statistics
asdoc sum birthrate_total birthrate_LessHS birthrate_HS birthrate_SomeCollege birthrate_Bach birthrate_Grad ln_total ln_women ln_infant ln_children ln_preg ln_post ln_breast ln_infantpb ln_infantfb ln_infantf unemp_rate share_white share_black share_asian share_hispanic formula_shortage if fullban == 1, dec(3) save(sumstats_month.doc) replace label

asdoc sum birthrate_total birthrate_LessHS birthrate_HS birthrate_SomeCollege birthrate_Bach birthrate_Grad ln_total ln_women ln_infant ln_children ln_preg ln_post ln_breast ln_infantpb ln_infantfb ln_infantf unemp_rate share_white share_black share_asian share_hispanic formula_shortage if protected == 1, dec(3) save(sumstats_month.doc) append label

drop if excluded == 1

foreach s of varlist birthrate_total birthrate_LessHS birthrate_HS birthrate_SomeCollege birthrate_Bach birthrate_Grad ln_total ln_women ln_infant ln_children ln_preg ln_post ln_breast ln_infantpb ln_infantfb ln_infantf unemp_rate share_white share_black share_asian share_hispanic formula_shortage{
	asdoc ttest `s', by(protected) save(balancetest_month.doc) rowappend
}


***Synthetic DID - rates

///Estimating with seasonally adjusted outcomes - residuals

use full_data_monthly.dta, clear

***Table 2: Birth Rates
**Total Birth Rate
foreach s of numlist 4 7 10 13{
	sdid birthrate_total_d statefips monthyear product_year if excluded == 0 & month <`s', vce(bootstrap) covariates(unemp_rate share_black share_white share_asian share_hispanic formula_shortage) seed(2024) reps(500)
	
	sum birthrate_total if fullban == 1 & year == 2022 & month <`s'
	local fertility = r(mean)
	outreg2 using birthrate_total.doc, append label nocon dec(3) ctitle(Birth Rate) ///
	title("Impact of Total Abortion Bans on Birth Rates") ///
	addnote("Note: Bootstrap standard errors are in parentheses. Birth rate was seasonally adjusted for each individual state prior to estimation. Additional controls include each state's annual unemployment rate, the share of the state population that is Black, White, Asian, and Hispanic, and an indicator for the infant formula shortage.") ///
	addtext(Additional Controls, Yes, Number of States, 37, Timeframe, Months < `s') ///
	addstat(Full Ban States 2022 Fertility Rate, `fertility')
}

**Less than High School
foreach s of numlist 4 7 10 13{
sdid birthrate_LessHS_d statefips monthyear product_year if excluded == 0 & month <`s', vce(bootstrap) covariates(unemp_rate share_black share_white share_asian share_hispanic formula_shortage) seed(2024) reps(500) 
	sum birthrate_LessHS if fullban == 1 & year == 2022 & month <`s'
	local fertility = r(mean)
	outreg2 using birthrate_educ_lessHS.doc, replace label nocon dec(3) ctitle(< High School Diploma) ///
	title("Impact of Total Abortion Bans on Births Rates by Mother's Education") ///
	addnote("Note: Bootstrap standard errors are in parentheses. Each outcomes was seasonally adjusted for each individual state prior to estimation. Additional controls include each state's annual unemployment rate, the share of the state population that is Black, White, Asian, and Hispanic, and an indicator for the infant formula shortage.") ///
	addtext(Additional Controls, Yes, Number of States, 37, Timeframe, Month < `s')  ///
	addstat(Full Ban States 2022 Fertility Rate, `fertility')
}
	
**High School
foreach s of numlist 4 7 10 13{
sdid birthrate_HS_d statefips monthyear product_year if excluded == 0 & month <`s', vce(bootstrap) covariates(unemp_rate share_black share_white share_asian share_hispanic formula_shortage) seed(2024) reps(500) 
	sum birthrate_HS if fullban == 1 & year == 2022 & month <`s'
	local fertility = r(mean)
	outreg2 using birthrate_educ_HS.doc, append label nocon dec(3) ctitle(High School Diploma) ///
	title("Impact of Total Abortion Bans on Births Rates by Mother's Education") ///
	addnote("Note: Bootstrap standard errors are in parentheses. Each outcomes was seasonally adjusted for each individual state prior to estimation. Additional controls include each state's annual unemployment rate, the share of the state population that is Black, White, Asian, and Hispanic, and an indicator for the infant formula shortage.") ///
	addtext(Additional Controls, Yes, Number of States, 37, Timeframe, Month < `s')  ///
	addstat(Full Ban States 2022 Fertility Rate, `fertility')
}

**Some College
foreach s of numlist 4 7 10 13{
sdid birthrate_SomeCollege_d statefips monthyear product_year if excluded == 0 & month <`s', vce(bootstrap) covariates(unemp_rate share_black share_white share_asian share_hispanic formula_shortage) seed(2024) reps(500) 
	sum birthrate_SomeCollege if fullban == 1 & year == 2022 & month <`s'
	local fertility = r(mean)
	outreg2 using birthrate_educ_somecollege.doc, append label nocon dec(3) ctitle(Some College) ///
	title("Impact of Total Abortion Bans on Births Rates by Mother's Education") ///
	addnote("Note: Bootstrap standard errors are in parentheses. Each outcomes was seasonally adjusted for each individual state prior to estimation. Additional controls include each state's annual unemployment rate, the share of the state population that is Black, White, Asian, and Hispanic, and an indicator for the infant formula shortage.") ///
	addtext(Additional Controls, Yes, Number of States, 37, Timeframe, Month < `s')  ///
	addstat(Full Ban States 2022 Fertility Rate, `fertility',)
}	

**Bachelor's Degree
foreach s of numlist 4 7 10 13{
sdid birthrate_Bach_d statefips monthyear product_year if excluded == 0 & month <`s', vce(bootstrap) covariates(unemp_rate share_black share_white share_asian share_hispanic formula_shortage) seed(2024) reps(500) 
	sum birthrate_Bach if fullban == 1 & year == 2022 & month <`s'
	local fertility = r(mean)
	outreg2 using birthrate_educ_bach.doc, append label nocon dec(3) ctitle(Bachelor's Degree) ///
	title("Impact of Total Abortion Bans on Births Rates by Mother's Education") ///
	addnote("Note: Bootstrap standard errors are in parentheses. Each outcomes was seasonally adjusted for each individual state prior to estimation. Additional controls include each state's annual unemployment rate, the share of the state population that is Black, White, Asian, and Hispanic, and an indicator for the infant formula shortage.") ///
	addtext(Additional Controls, Yes, Number of States, 37, Timeframe, Month < `s')  ///
	addstat(Full Ban States 2022 Fertility Rate, `fertility')	
}	

**Graduate Degree
foreach s of numlist 4 7 10 13{
sdid birthrate_Grad_d statefips monthyear product_year if excluded == 0 & month <`s', vce(bootstrap) covariates(unemp_rate share_black share_white share_asian share_hispanic formula_shortage) seed(2024) reps(500) 
	sum birthrate_Grad if fullban == 1 & year == 2022 & month <`s'
	local fertility = r(mean)
	outreg2 using birthrate_educ_grad.doc, append label nocon dec(3) ctitle(Graduate Degree) ///
	title("Impact of Total Abortion Bans on Births Rates by Mother's Education") ///
	addnote("Note: Bootstrap standard errors are in parentheses. Each outcomes was seasonally adjusted for each individual state prior to estimation. Additional controls include each state's annual unemployment rate, the share of the state population that is Black, White, Asian, and Hispanic, and an indicator for the infant formula shortage.") ///
	addtext(Additional Controls, Yes, Number of States, 37, Timeframe, Month < `s')  ///
	addstat(Full Ban States 2022 Fertility Rate, `fertility')
}	

	
***Table 3 - WIC Participation	
**Total 
sdid ln_total_d statefips monthyear product_year if excluded == 0, vce(bootstrap) covariates(unemp_rate share_black share_white share_asian share_hispanic formula_shortage) seed(2024) reps(500) 
	outreg2 using wic.doc, append label nocon dec(3) ctitle(Total Participants) ///
	title("Impact of Total Abortion Bans on WIC Participation (logged)") ///
	addnote("Note: Bootstrap standard errors are in parentheses. Additional controls include each state's annual unemployment rate, the share of the state population that is Black, White, Asian, and Hispanic, and an indicator for the infant formula shortage.") ///
	addtext(Additional Controls, Yes, Number of States, 37)	
	
**Women
sdid ln_women_d statefips monthyear product_year if excluded == 0, vce(bootstrap) covariates(unemp_rate share_black share_white share_asian share_hispanic formula_shortage) seed(2024) reps(500) 
	outreg2 using wic.doc, append label nocon dec(3) ctitle(Women) ///
	addtext(Additional Controls, Yes, Number of States, 37)

**Infant	
sdid ln_infant_d statefips monthyear product_year if excluded == 0, vce(bootstrap) covariates(unemp_rate share_black share_white share_asian share_hispanic formula_shortage) seed(2024) reps(500) 
	outreg2 using wic.doc, append label nocon dec(3) ctitle(Infants) ///
	addtext(Additional Controls, Yes, Number of States, 37)

**Children
sdid ln_children_d statefips monthyear product_year if excluded == 0, vce(bootstrap) covariates(unemp_rate share_black share_white share_asian share_hispanic formula_shortage) seed(2024) reps(500) 
	outreg2 using wic.doc, append label nocon dec(3) ctitle(Children) ///
	addtext(Additional Controls, Yes, Number of States, 37)

**Pregnant Women
sdid ln_preg_d statefips monthyear product_year if excluded == 0, vce(bootstrap) covariates(unemp_rate share_black share_white share_asian share_hispanic formula_shortage) seed(2024) reps(500) 
	outreg2 using wic.doc, append label nocon dec(3) ctitle(Pregnant Women) ///
	addtext(Additional Controls, Yes, Number of States, 37)
	
**Breastfeeding Women
sdid ln_breast_d statefips monthyear product_year if excluded == 0, vce(bootstrap) covariates(unemp_rate share_black share_white share_asian share_hispanic formula_shortage) seed(2024) reps(500) 
	outreg2 using wic.doc, append label nocon dec(3) ctitle(Breastfeeding Women) ///
	addtext(Additional Controls, Yes, Number of States, 37)	
	
**Postpartum Women
sdid ln_post_d statefips monthyear product_year if excluded == 0, vce(bootstrap) covariates(unemp_rate share_black share_white share_asian share_hispanic formula_shortage) seed(2024) reps(500) 
	outreg2 using wic.doc, append label nocon dec(3) ctitle(Postpartum Women) ///
	addtext(Additional Controls, Yes, Number of States, 37)
	
*Partially Breastfed Infants
sdid ln_infantpb_d statefips monthyear product_year if excluded == 0, vce(bootstrap) covariates(unemp_rate share_black share_white share_asian share_hispanic formula_shortage) seed(2024) reps(500) 
	outreg2 using wic.doc, append label nocon dec(3) ctitle(Partially Breastfed Infants) ///
	addtext(Additional Controls, Yes, Number of States, 37)
	
**Fully Breastfed Infants
sdid ln_infantfb_d statefips monthyear product_year if excluded == 0, vce(bootstrap) covariates(unemp_rate share_black share_white share_asian share_hispanic formula_shortage) seed(2024) reps(500) 
	outreg2 using wic.doc, append label nocon dec(3) ctitle(Fully Breastfed Infants) ///
	addtext(Additional Controls, Yes, Number of States, 37)	
	
**Fully Formula Fed Infants
sdid ln_infantf_d statefips monthyear product_year if excluded == 0, vce(bootstrap) covariates(unemp_rate share_black share_white share_asian share_hispanic formula_shortage) seed(2024) reps(500) 
	outreg2 using wic.doc, append label nocon dec(3) ctitle(Fully Formula Fed Infants) ///
	addtext(Additional Controls, Yes, Number of States, 37)

	
**Back of the envelope calculation & average WIC participations for Table 3 column (2)
*WIC outcomes
use full_data_monthly.dta, clear

collapse (sum) preg women infant child total breast post infantpb infantfb infantf, by(year month fullban protected excluded)

collapse (mean) preg women infant child total breast post infantpb infantfb infantf, by(year fullban protected excluded)

*Birth rates - 6 months
use full_data_monthly.dta, clear

collapse (sum) births_total births_lesshs births_hs births_somecollege births_bach births_grad births_medicaid births_insurance births_self births_other if month <7, by(year month fullban protected excluded)

collapse (mean) births_total births_lesshs births_hs births_somecollege births_bach births_grad births_medicaid births_insurance births_self births_other if month <7, by(year fullban protected excluded)



