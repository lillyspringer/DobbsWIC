***Table A2: Robustness Checks
**Medicaid Expansion 
use full_data_monthly.dta, clear

sdid birthrate_total_d statefips monthyear product_year if excluded == 0 & month <7, vce(bootstrap) covariates(unemp_rate share_black share_white share_asian share_hispanic formula_shortage expand_medicaid) seed(2024) reps(500) 

	sum birthrate_total if fullban == 1 & year == 2022 & month <7
	local fertility = r(mean)
	outreg2 using birthrate_robustness.doc, replace label nocon dec(3) ctitle(Birth Rate) ///
	title("Impact of Total Abortion Bans on Birth Rates - Robustness Checks") ///
	addnote("Note: Bootstrap standard errors are in parentheses. Birth rate data ranges from January to June of each year. Each model includes controls for each state's annual unemployment rate and the share of the state population that is Black, White, Asian, and Hispanic.") ///
	addtext(Number of States, 37, Check, Medicaid Expansion) ///
	addstat(Full Ban States 2022 Fertility Rate, `fertility')
	
sdid birthrate_HS_d statefips monthyear product_year if excluded == 0 & month <7, vce(bootstrap) covariates(unemp_rate share_black share_white share_asian share_hispanic formula_shortage expand_medicaid) seed(2024) reps(500) 

	sum birthrate_HS if fullban == 1 & year == 2022 & month <7
	local fertility = r(mean)
	outreg2 using birthrate_robustness.doc, append label nocon dec(3) ctitle(HS Birth Rate) ///
	addtext(Number of States, 37, Check, Medicaid Expansion) ///
	addstat(Full Ban States 2022 Fertility Rate, `fertility')
	
sdid ln_total_d statefips monthyear product_year if excluded == 0, vce(bootstrap) covariates(unemp_rate share_black share_white share_asian share_hispanic formula_shortage expand_medicaid) seed(2024) reps(500)

	outreg2 using wic_robustness.doc, replace label nocon dec(3) ctitle(Total Participants) ///
	addtext(Number of States, 37, Check, Medicaid Expansion)
	
sdid ln_infant_d statefips monthyear product_year if excluded == 0, vce(bootstrap) covariates(unemp_rate share_black share_white share_asian share_hispanic formula_shortage expand_medicaid) seed(2024) reps(500)

	outreg2 using wic_robustness.doc, append label nocon dec(3) ctitle(Infants) ///
	addtext(Number of States, 37, Check, Medicaid Expansion)	

sdid ln_post_d statefips monthyear product_year if excluded == 0, vce(bootstrap) covariates(unemp_rate share_black share_white share_asian share_hispanic formula_shortage expand_medicaid) seed(2024) reps(500) 

	outreg2 using wic_robustness.doc, append label nocon dec(3) ctitle(Postpartum Women) ///
	addtext(Number of States, 37, Check, Medicaid Expansion)	
	
sdid ln_infantf_d statefips monthyear product_year if excluded == 0, vce(bootstrap) covariates(unemp_rate share_black share_white share_asian share_hispanic formula_shortage expand_medicaid) seed(2024) reps(500) 

	outreg2 using wic_robustness.doc, append label nocon dec(3) ctitle(Formula-Fed Infants) ///
	addtext(Number of States, 37, Check, Medicaid Expansion)	


	
***Figure A4: Leave-One-Out Treated States Robustness Check
**Total Birth Rate
use full_data_monthly.dta, clear

sdid birthrate_total_d statefips monthyear product_year if excluded == 0 & month <7, vce(bootstrap) covariates(unemp_rate share_black share_white share_asian share_hispanic formula_shortage) seed(2024) reps(500)
	
	estimate store birthrate_baseline

foreach s of numlist 1 5 16 21 22 28 29 40 46 47 48 54 55{
	use full_data_monthly.dta, clear 
	drop if statefips == `s'
	
	sdid birthrate_total_d statefips monthyear product_year if excluded == 0 & month <7, vce(bootstrap) covariates(unemp_rate share_black share_white share_asian share_hispanic formula_shortage) seed(2024) reps(500) 
	
	estimate store birthrate_`s'
}

coefplot (birthrate_baseline, aseq(Baseline)) (birthrate_1, aseq(Alabama)) (birthrate_5, aseq(Arkansas)) (birthrate_16, aseq(Idaho)) (birthrate_21, aseq(Kentucky)) (birthrate_22, aseq(Louisiana)) (birthrate_28,aseq(Mississippi)) (birthrate_29, aseq(Missouri)) (birthrate_40, aseq(Oklahoma))  (birthrate_46, aseq(South Dakota)) (birthrate_47, aseq(Tennessee)) (birthrate_48, aseq(Texas)) (birthrate_54, aseq(West Virgina)) (birthrate_55, aseq(Wyoming)), swapnames legend(off) xtitle(Birth Rate) ytitle(State Dropped) title(Total Birth Rate) subtitle(January-June)
graph save birthrate_loo_nonseasonal.gph, replace

**High School Birth Rate
use full_data_monthly.dta, clear

sdid birthrate_HS_d statefips monthyear product_year if excluded == 0 & month <7, vce(bootstrap) covariates(unemp_rate share_black share_white share_asian share_hispanic formula_shortage) seed(2024) reps(500)
	
	estimate store birthrateHS_baseline

foreach s of numlist 1 5 16 21 22 28 29 40 46 47 48 54 55{
	use full_data_monthly.dta, clear 
	drop if statefips == `s'
	
	sdid birthrate_HS_d statefips monthyear product_year if excluded == 0 & month <7, vce(bootstrap) covariates(unemp_rate share_black share_white share_asian share_hispanic formula_shortage) seed(2024) reps(500) 
	
	estimate store birthrateHS_`s'
}

coefplot (birthrateHS_baseline, aseq(Baseline)) (birthrateHS_1, aseq(Alabama)) (birthrateHS_5, aseq(Arkansas)) (birthrateHS_16, aseq(Idaho)) (birthrateHS_21, aseq(Kentucky)) (birthrateHS_22, aseq(Louisiana)) (birthrateHS_28,aseq(Mississippi)) (birthrateHS_29, aseq(Missouri)) (birthrateHS_40, aseq(Oklahoma))  (birthrateHS_46, aseq(South Dakota)) (birthrateHS_47, aseq(Tennessee)) (birthrateHS_48, aseq(Texas)) (birthrateHS_54, aseq(West Virgina)) (birthrateHS_55, aseq(Wyoming)), swapnames legend(off) xtitle(Birth Rate) ytitle(State Dropped) title(Birth Rate - High School) subtitle(January-June)
graph save birthrateHS_loo_nonseasonal.gph, replace

**WIC Postpartum Women
use full_data_monthly.dta, clear

sdid ln_post_d statefips monthyear product_year if excluded == 0, vce(bootstrap) covariates(unemp_rate share_black share_white share_asian share_hispanic formula_shortage) seed(2024) reps(500) 
	
	estimate store wicpost_baseline

foreach s of numlist 1 5 16 21 22 28 29 40 46 47 48 54 55{
	use full_data_monthly.dta, clear 
	drop if statefips == `s'
	
	sdid ln_post_d statefips monthyear product_year if excluded == 0, vce(bootstrap) covariates(unemp_rate share_black share_white share_asian share_hispanic formula_shortage) seed(2024) reps(500)

	estimate store wicpost_`s'
}

coefplot (wicpost_baseline, aseq(Baseline)) (wicpost_1, aseq(Alabama)) (wicpost_5, aseq(Arkansas)) (wicpost_16, aseq(Idaho)) (wicpost_21, aseq(Kentucky)) (wicpost_22, aseq(Louisiana)) (wicpost_28, aseq(Mississippi)) (wicpost_29, aseq(Missouri)) (wicpost_40, aseq(Oklahoma)) (wicpost_46, aseq(South Dakota)) (wicpost_47, aseq(Tennessee)) (wicpost_48, aseq(Texas)) (wicpost_54, aseq(West Virgina)) (wicpost_55, aseq(Wyoming)), swapnames legend(off) xtitle(Participation (logged)) ytitle(State Dropped) title(WIC - Postpartum Women)
graph save wicpost_loo_nonseasonal.gph, replace

**WIC Infants
use full_data_monthly.dta, clear

sdid ln_infant_d statefips monthyear product_year if excluded == 0, vce(bootstrap) covariates(unemp_rate share_black share_white share_asian share_hispanic formula_shortage) seed(2024) reps(500)

	estimate store wicinfant_baseline

foreach s of numlist 1 5 16 21 22 28 29 40 46 47 48 54 55{
	use full_data_monthly.dta, clear 
	drop if statefips == `s'
	
	sdid ln_infant_d statefips monthyear product_year if excluded == 0, vce(bootstrap) covariates(unemp_rate share_black share_white share_asian share_hispanic formula_shortage) seed(2024) reps(500) 
	
	estimate store wicinfant_`s'
}

coefplot (wicinfant_baseline, aseq(Baseline)) (wicinfant_1, aseq(Alabama)) (wicinfant_5, aseq(Arkansas)) (wicinfant_16, aseq(Idaho)) (wicinfant_21, aseq(Kentucky)) (wicinfant_22, aseq(Louisiana)) (wicinfant_28,aseq(Mississippi)) (wicinfant_29, aseq(Missouri)) (wicinfant_40, aseq(Oklahoma)) (wicinfant_46, aseq(South Dakota)) (wicinfant_47, aseq(Tennessee)) (wicinfant_48, aseq(Texas)) (wicinfant_54, aseq(West Virgina)) (wicinfant_55, aseq(Wyoming)), swapnames legend(off) xtitle(Participation (logged)) ytitle(State Dropped) title(WIC - Infants)
graph save wicinfant_loo_nonseasonal.gph, replace

graph combine birthrate_loo_nonseasonal.gph birthrateHS_loo_nonseasonal.gph wicpost_loo_nonseasonal.gph wicinfant_loo_nonseasonal.gph, rows(1) title(Dropped States Robustness Check) xsize(7) ysize(3)
graph export state_loo_nonseasonal.svg, replace as(svg)

**WIC Fully Formula Fed Infants
use full_data_monthly.dta, clear

sdid ln_infantf_d statefips monthyear product_year if excluded == 0, vce(bootstrap) covariates(unemp_rate share_black share_white share_asian share_hispanic formula_shortage) seed(2024) reps(500)

	estimate store wicinfantf_baseline

foreach s of numlist 1 5 16 21 22 28 29 40 46 47 48 54 55{
	use full_data_monthly.dta, clear 
	drop if statefips == `s'
	
	sdid ln_infantf_d statefips monthyear product_year if excluded == 0, vce(bootstrap) covariates(unemp_rate share_black share_white share_asian share_hispanic formula_shortage) seed(2024) reps(500) 
	
	estimate store wicinfantf_`s'
}

coefplot (wicinfantf_baseline, aseq(Baseline)) (wicinfantf_1, aseq(Alabama)) (wicinfantf_5, aseq(Arkansas)) (wicinfantf_16, aseq(Idaho)) (wicinfantf_21, aseq(Kentucky)) (wicinfantf_22, aseq(Louisiana)) (wicinfantf_28,aseq(Mississippi)) (wicinfantf_29, aseq(Missouri)) (wicinfantf_40, aseq(Oklahoma)) (wicinfantf_46, aseq(South Dakota)) (wicinfantf_47, aseq(Tennessee)) (wicinfantf_48, aseq(Texas)) (wicinfantf_54, aseq(West Virgina)) (wicinfantf_55, aseq(Wyoming)), swapnames legend(off) xtitle(Participation (logged)) ytitle(State Dropped) title(WIC - Formula Infants)
graph save wicinfantf_loo_nonseasonal.gph, replace

graph combine birthrate_loo_nonseasonal.gph birthrateHS_loo_nonseasonal.gph wicpost_loo_nonseasonal.gph wicinfant_loo_nonseasonal.gph wicinfantf_loo_nonseasonal.gph, rows(1) title(Dropped States Robustness Check) xsize(18) ysize(6)
graph export state_loo_nonseasonal.svg, replace as(svg)
graph export state_loo_nonseasonal.png, replace as(png)
graph export state_loo_nonseasonal.jpg, replace as(jpg)



