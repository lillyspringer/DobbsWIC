***Event Studies

***Figure 2: WIC Participation SDID Event Studies 
**Total Participation
use full_data_monthly.dta, clear
xtset statefips monthyear
qui sdid ln_total_d statefips monthyear product_year if excluded == 0, vce(noinference) covariates(unemp_rate share_black share_white share_asian share_hispanic formula_shortage) graph
matrix lambda = e(lambda)[1..72,1]
matrix yco = e(series)[1..72,2]
matrix ytr = e(series)[1..72,3]
matrix aux = lambda'*(ytr-yco)
scalar meanpre_o = aux[1,1]

matrix difference = e(difference)[1..84,1..2]
svmat difference
ren (difference1 difference2) (time d)
replace d = d - meanpre_o

local b = 1
local B = 500
while `b' <= `B'{
	preserve
	bsample, cluster(statefips) idcluster(c2)
	qui count if product_year == 0
	local r1 = r(N)
	qui count if product_year != 0
	local r2 = r(N)
	if (`r1'!=0 & `r2' !=0){
		qui sdid ln_total_d c2 monthyear product_year if excluded == 0, vce(noinference) covariates(unemp_rate share_black share_white share_asian share_hispanic formula_shortage) graph
		matrix lambda_b = e(lambda)[1..72,1]
		matrix yco_b = e(series)[1..72,2]
		matrix ytr_b = e(series)[1..72,3]
		matrix aux_b = lambda_b'*(ytr_b - yco_b)
		matrix meanpre_b = J(84, 1, aux_b[1,1])
		
		matrix d`b' = e(difference)[1..84,2] - meanpre_b
		local ++b	
	}
	restore
}

keep time d
keep if time !=.

local b = 1
local B = 500

forval b=1/`B' {
	svmat d`b'
}

egen rsd = rowsd(d11 - d5001)
gen LCI = d + invnormal(0.025)*rsd
gen UCI = d + invnormal(0.975)*rsd

tw rarea UCI LCI time, lwidth(none) fcolor(purple%50) fintensity(inten40) || connected d time, color(purple) m(d) msymbol(O) mcolor(black) msize(tiny) xtitle(" ") ytitle("Pariticpation (logged)") xline(756, lc(grey%40) lp(shortdash)) yline(0, lc(grey) lp(solid)) xla(684(6)765, format(%tm) angle(45)) legend(off) title("Total")

graph save event_total_WICln_month_nonseasonal, replace

**Women
use full_data_monthly.dta, clear
xtset statefips monthyear
qui sdid ln_women_d statefips monthyear product_year if excluded == 0, vce(noinference) covariates(unemp_rate share_black share_white share_asian share_hispanic formula_shortage) graph
matrix lambda = e(lambda)[1..72,1]
matrix yco = e(series)[1..72,2]
matrix ytr = e(series)[1..72,3]
matrix aux = lambda'*(ytr-yco)
scalar meanpre_o = aux[1,1]

matrix difference = e(difference)[1..84,1..2]
svmat difference
ren (difference1 difference2) (time d)
replace d = d - meanpre_o

local b = 1
local B = 500
while `b' <= `B'{
	preserve
	bsample, cluster(statefips) idcluster(c2)
	qui count if product_year == 0
	local r1 = r(N)
	qui count if product_year != 0
	local r2 = r(N)
	if (`r1'!=0 & `r2' !=0){
		qui sdid ln_women_d c2 monthyear product_year if excluded == 0, vce(noinference) covariates(unemp_rate share_black share_white share_asian share_hispanic formula_shortage) graph
		matrix lambda_b = e(lambda)[1..72,1]
		matrix yco_b = e(series)[1..72,2]
		matrix ytr_b = e(series)[1..72,3]
		matrix aux_b = lambda_b'*(ytr_b - yco_b)
		matrix meanpre_b = J(84, 1, aux_b[1,1])
		
		matrix d`b' = e(difference)[1..84,2] - meanpre_b
		local ++b	
	}
	restore
}

keep time d
keep if time !=.

local b = 1
local B = 500

forval b=1/`B' {
	svmat d`b'
}

egen rsd = rowsd(d11 - d5001)
gen LCI = d + invnormal(0.025)*rsd
gen UCI = d + invnormal(0.975)*rsd

tw rarea UCI LCI time, lwidth(none) fcolor(purple%50) fintensity(inten40) || connected d time, color(purple) m(d) msymbol(O) msize(tiny) mcolor(black) xtitle(" ") ytitle("Pariticpation (logged)") xline(756, lc(grey%40) lp(shortdash)) yline(0, lc(grey) lp(solid)) xla(684(6)765, format(%tm) angle(45)) legend(off) title("Women")

graph save event_women_WICln_month_nonseasonal, replace

**Infants 
use full_data_monthly.dta, clear
xtset statefips monthyear

qui sdid ln_infant_d statefips monthyear product_year if excluded == 0, vce(noinference) covariates(unemp_rate share_black share_white share_asian share_hispanic formula_shortage) graph
matrix lambda = e(lambda)[1..72,1]
matrix yco = e(series)[1..72,2]
matrix ytr = e(series)[1..72,3]
matrix aux = lambda'*(ytr-yco)
scalar meanpre_o = aux[1,1]

matrix difference = e(difference)[1..84,1..2]
svmat difference
ren (difference1 difference2) (time d)
replace d = d - meanpre_o

local b = 1
local B = 500
while `b' <= `B'{
	preserve
	bsample, cluster(statefips) idcluster(c2)
	qui count if product_year == 0
	local r1 = r(N)
	qui count if product_year != 0
	local r2 = r(N)
	if (`r1'!=0 & `r2' !=0){
		qui sdid ln_infant_d c2 monthyear product_year if excluded == 0, vce(noinference) covariates(unemp_rate share_black share_white share_asian share_hispanic formula_shortage) graph
		matrix lambda_b = e(lambda)[1..72,1]
		matrix yco_b = e(series)[1..72,2]
		matrix ytr_b = e(series)[1..72,3]
		matrix aux_b = lambda_b'*(ytr_b - yco_b)
		matrix meanpre_b = J(84, 1, aux_b[1,1])
		
		matrix d`b' = e(difference)[1..84,2] - meanpre_b
		local ++b	
	}
	restore
}

keep time d
keep if time !=.

local b = 1
local B = 500

forval b=1/`B' {
	svmat d`b'
}

egen rsd = rowsd(d11 - d5001)
gen LCI = d + invnormal(0.025)*rsd
gen UCI = d + invnormal(0.975)*rsd

tw rarea UCI LCI time, lwidth(none) fcolor(purple%50) fintensity(inten40) || connected d time, color(purple) m(d) msymbol(O) msize(tiny) mcolor(black) xtitle(" ") ytitle("Pariticpation (logged)") xline(756, lc(grey%40) lp(shortdash)) yline(0, lc(grey) lp(solid)) xla(684(6)765, format(%tm) angle(45)) legend(off) title("Infant")

graph save event_infant_WICln_month_nonseasonal, replace

**Children
use full_data_monthly.dta, clear
xtset statefips monthyear
qui sdid ln_children_d statefips monthyear product_year if excluded == 0, vce(noinference) covariates(unemp_rate share_black share_white share_asian share_hispanic formula_shortage) graph
matrix lambda = e(lambda)[1..72,1]
matrix yco = e(series)[1..72,2]
matrix ytr = e(series)[1..72,3]
matrix aux = lambda'*(ytr-yco)
scalar meanpre_o = aux[1,1]

matrix difference = e(difference)[1..84,1..2]
svmat difference
ren (difference1 difference2) (time d)
replace d = d - meanpre_o

local b = 1
local B = 500
while `b' <= `B'{
	preserve
	bsample, cluster(statefips) idcluster(c2)
	qui count if product_year == 0
	local r1 = r(N)
	qui count if product_year != 0
	local r2 = r(N)
	if (`r1'!=0 & `r2' !=0){
		qui sdid ln_children_d c2 monthyear product_year if excluded == 0, vce(noinference) covariates(unemp_rate share_black share_white share_asian share_hispanic formula_shortage) graph
		matrix lambda_b = e(lambda)[1..72,1]
		matrix yco_b = e(series)[1..72,2]
		matrix ytr_b = e(series)[1..72,3]
		matrix aux_b = lambda_b'*(ytr_b - yco_b)
		matrix meanpre_b = J(84, 1, aux_b[1,1])
		
		matrix d`b' = e(difference)[1..84,2] - meanpre_b
		local ++b	
	}
	restore
}

keep time d
keep if time !=.

local b = 1
local B = 500

forval b=1/`B' {
	svmat d`b'
}

egen rsd = rowsd(d11 - d5001)
gen LCI = d + invnormal(0.025)*rsd
gen UCI = d + invnormal(0.975)*rsd

tw rarea UCI LCI time, lwidth(none) fcolor(purple%50) fintensity(inten40) || connected d time, color(purple) m(d) msymbol(O) msize(tiny) mcolor(black) xtitle(" ") ytitle("Pariticpation (logged)") xline(756, lc(grey%40) lp(shortdash)) yline(0, lc(grey) lp(solid)) xla(684(6)765, format(%tm) angle(45)) legend(off) title("Children")

graph save event_child_WICln_month_nonseasonal, replace

*Combine graphs into one figure
graph combine event_total_WICln_month_nonseasonal.gph event_women_WICln_month_nonseasonal.gph event_infant_WICln_month_nonseasonal.gph event_child_WICln_month_nonseasonal.gph, rows(2) ycommon xsize(10) ysize(6)
graph save event_WICln_broad_month_nonseasonal, replace
graph export event_WICln_broad_month_nonseasonal.svg, replace as(svg)
graph export event_WICln_broad_month_nonseasonal.png, replace as(png)
***Figure A1: TWFE Event Studies
gen ttt_month = 0 
replace ttt_month = monthyear - 756 if fullban == 1

eventdd birthrate_total_d if excluded == 0, method(fe) timevar(ttt_month) ci(rarea) noline graph_op(xtitle("Month Since Ban", size(medsmall)) ytitle("Birth Rate", size(medsmall)) legend(off) yline(0, lcolor(black)) xline(-1, lcolor(gs8)) xlabel(-72(7)11) title("Impact of Abortion Bans on Birth Rate") subtitle(" ") lwidth(none) fcolor(purple%50) fintensity(inten40)) coef_op(mcolor(purple) msize(vsmall) connect(direct) lcolor(black))
graph export did_birthrate_total_nonseasonal.png, replace as(png)

eventdd ln_total_d if excluded == 0, method(fe) timevar(ttt_month) ci(rarea) noline graph_op(xtitle("Month Since Ban", size(medsmall)) ytitle("Participation (logged)", size(medsmall)) legend(off) yline(0, lcolor(black)) xline(-1, lcolor(gs8)) xlabel(-72(7)11) title("Impact of Abortion Bans on WIC Participation") subtitle(" ") lwidth(none) fcolor(purple%50) fintensity(inten40)) coef_op(mcolor(purple) msize(vsmall) connect(direct) lcolor(black))
graph export did_wicln_total_nonseasonal.png, replace as(png)


***Figure A2: SDID Event Studies for Birth Rates by Mother's Educational Attainment
**Birth Rate - Less HS
use full_data_monthly.dta, clear
xtset statefips monthyear
qui sdid birthrate_LessHS_d statefips monthyear product_year if excluded == 0, vce(noinference) covariates(unemp_rate share_black share_white share_asian share_hispanic formula_shortage) graph
matrix lambda = e(lambda)[1..72,1]
matrix yco = e(series)[1..72,2]
matrix ytr = e(series)[1..72,3]
matrix aux = lambda'*(ytr-yco)
scalar meanpre_o = aux[1,1]

matrix difference = e(difference)[1..84,1..2]
svmat difference
ren (difference1 difference2) (time d)
replace d = d - meanpre_o

local b = 1
local B = 500
while `b' <= `B'{
	preserve
	bsample, cluster(statefips) idcluster(c2)
	qui count if product_year == 0
	local r1 = r(N)
	qui count if product_year != 0
	local r2 = r(N)
	if (`r1'!=0 & `r2' !=0){
		qui sdid birthrate_LessHS_d c2 monthyear product_year if excluded == 0, vce(noinference) covariates(unemp_rate share_black share_white share_asian share_hispanic formula_shortage) graph
		matrix lambda_b = e(lambda)[1..72,1]
		matrix yco_b = e(series)[1..72,2]
		matrix ytr_b = e(series)[1..72,3]
		matrix aux_b = lambda_b'*(ytr_b - yco_b)
		matrix meanpre_b = J(84, 1, aux_b[1,1])
		
		matrix d`b' = e(difference)[1..84,2] - meanpre_b
		local ++b	
	}
	restore
}

preserve
keep time d
keep if time !=.

local b = 1
local B = 500

forval b=1/`B' {
	svmat d`b'
}

egen rsd = rowsd(d11 - d5001)
gen LCI = d + invnormal(0.025)*rsd
gen UCI = d + invnormal(0.975)*rsd

tw rarea UCI LCI time, lwidth(none) fcolor(purple%50) fintensity(inten40) || connected d time, color(purple) m(d) msymbol(O) mcolor(black) msize(tiny) xtitle(" ") ytitle("Birth Rate") xline(756, lc(grey%40) lp(shortdash)) yline(0, lc(grey) lp(solid)) xla(684(6)765, format(%tm) angle(45)) legend(off) title("Less than HS")

graph save event_birthrate_lessHS_month_nonseasonal, replace
graph export event_birthrate_less_HS_month_nonseasonal.svg, replace as(svg)

**Birth Rate - High School
use full_data_monthly.dta, clear
xtset statefips monthyear
qui sdid birthrate_HS_d statefips monthyear product_year if excluded == 0, vce(noinference) covariates(unemp_rate share_black share_white share_asian share_hispanic formula_shortage) graph
matrix lambda = e(lambda)[1..72,1]
matrix yco = e(series)[1..72,2]
matrix ytr = e(series)[1..72,3]
matrix aux = lambda'*(ytr-yco)
scalar meanpre_o = aux[1,1]

matrix difference = e(difference)[1..84,1..2]
svmat difference
ren (difference1 difference2) (time d)
replace d = d - meanpre_o

local b = 1
local B = 500
while `b' <= `B'{
	preserve
	bsample, cluster(statefips) idcluster(c2)
	qui count if product_year == 0
	local r1 = r(N)
	qui count if product_year != 0
	local r2 = r(N)
	if (`r1'!=0 & `r2' !=0){
		qui sdid birthrate_HS_d c2 monthyear product_year if excluded == 0, vce(noinference) covariates(unemp_rate share_black share_white share_asian share_hispanic formula_shortage) graph
		matrix lambda_b = e(lambda)[1..72,1]
		matrix yco_b = e(series)[1..72,2]
		matrix ytr_b = e(series)[1..72,3]
		matrix aux_b = lambda_b'*(ytr_b - yco_b)
		matrix meanpre_b = J(84, 1, aux_b[1,1])
		
		matrix d`b' = e(difference)[1..84,2] - meanpre_b
		local ++b	
	}
	restore
}

preserve
keep time d
keep if time !=.

local b = 1
local B = 500

forval b=1/`B' {
	svmat d`b'
}

egen rsd = rowsd(d11 - d5001)
gen LCI = d + invnormal(0.025)*rsd
gen UCI = d + invnormal(0.975)*rsd

tw rarea UCI LCI time, lwidth(none) fcolor(purple%50) fintensity(inten40) || connected d time, color(purple) m(d) msymbol(O) mcolor(black) msize(tiny) xtitle(" ") ytitle("Birth Rate") xline(756, lc(grey%40) lp(shortdash)) yline(0, lc(grey) lp(solid)) xla(684(6)765, format(%tm) angle(45)) legend(off) title("High School")

graph save event_birthrate_HS_month_nonseasonal, replace
graph export event_birthrate_HS_month_nonseasonal.svg, replace as(svg)

**Birth Rate - Some College
use full_data_monthly.dta, clear
xtset statefips monthyear
qui sdid birthrate_SomeCollege_d statefips monthyear product_year if excluded == 0, vce(noinference) covariates(unemp_rate share_black share_white share_asian share_hispanic formula_shortage) graph
matrix lambda = e(lambda)[1..72,1]
matrix yco = e(series)[1..72,2]
matrix ytr = e(series)[1..72,3]
matrix aux = lambda'*(ytr-yco)
scalar meanpre_o = aux[1,1]

matrix difference = e(difference)[1..84,1..2]
svmat difference
ren (difference1 difference2) (time d)
replace d = d - meanpre_o

local b = 1
local B = 500
while `b' <= `B'{
	preserve
	bsample, cluster(statefips) idcluster(c2)
	qui count if product_year == 0
	local r1 = r(N)
	qui count if product_year != 0
	local r2 = r(N)
	if (`r1'!=0 & `r2' !=0){
		qui sdid birthrate_SomeCollege_d c2 monthyear product_year if excluded == 0, vce(noinference) covariates(unemp_rate share_black share_white share_asian share_hispanic formula_shortage) graph
		matrix lambda_b = e(lambda)[1..72,1]
		matrix yco_b = e(series)[1..72,2]
		matrix ytr_b = e(series)[1..72,3]
		matrix aux_b = lambda_b'*(ytr_b - yco_b)
		matrix meanpre_b = J(84, 1, aux_b[1,1])
		
		matrix d`b' = e(difference)[1..84,2] - meanpre_b
		local ++b	
	}
	restore
}

keep time d
keep if time !=.

local b = 1
local B = 500

forval b=1/`B' {
	svmat d`b'
}

egen rsd = rowsd(d11 - d5001)
gen LCI = d + invnormal(0.025)*rsd
gen UCI = d + invnormal(0.975)*rsd

tw rarea UCI LCI time, lwidth(none) fcolor(purple%50) fintensity(inten40) || connected d time, color(purple) m(d) msymbol(O) mcolor(black) msize(tiny) xtitle(" ") ytitle("Birth Rate") xline(756, lc(grey%40) lp(shortdash)) yline(0, lc(grey) lp(solid)) xla(684(6)765, format(%tm) angle(45)) legend(off) title("Some College")

graph save event_birthrate_somecollege_month_nonseasonal, replace
graph export event_birthrate_somecollege_month_nonseasonal.svg, replace as(svg)

**Birth Rate - Bachelor's Degree
use full_data_monthly.dta, clear
xtset statefips monthyear
qui sdid birthrate_Bach_d statefips monthyear product_year if excluded == 0, vce(noinference) covariates(unemp_rate share_black share_white share_asian share_hispanic formula_shortage) graph
matrix lambda = e(lambda)[1..72,1]
matrix yco = e(series)[1..72,2]
matrix ytr = e(series)[1..72,3]
matrix aux = lambda'*(ytr-yco)
scalar meanpre_o = aux[1,1]

matrix difference = e(difference)[1..84,1..2]
svmat difference
ren (difference1 difference2) (time d)
replace d = d - meanpre_o

local b = 1
local B = 500
while `b' <= `B'{
	preserve
	bsample, cluster(statefips) idcluster(c2)
	qui count if product_year == 0
	local r1 = r(N)
	qui count if product_year != 0
	local r2 = r(N)
	if (`r1'!=0 & `r2' !=0){
		qui sdid birthrate_Bach_d c2 monthyear product_year if excluded == 0, vce(noinference) covariates(unemp_rate share_black share_white share_asian share_hispanic formula_shortage) graph
		matrix lambda_b = e(lambda)[1..72,1]
		matrix yco_b = e(series)[1..72,2]
		matrix ytr_b = e(series)[1..72,3]
		matrix aux_b = lambda_b'*(ytr_b - yco_b)
		matrix meanpre_b = J(84, 1, aux_b[1,1])
		
		matrix d`b' = e(difference)[1..84,2] - meanpre_b
		local ++b	
	}
	restore
}

keep time d
keep if time !=.

local b = 1
local B = 500

forval b=1/`B' {
	svmat d`b'
}

egen rsd = rowsd(d11 - d5001)
gen LCI = d + invnormal(0.025)*rsd
gen UCI = d + invnormal(0.975)*rsd

tw rarea UCI LCI time, lwidth(none) fcolor(purple%50) fintensity(inten40) || connected d time, color(purple) m(d) msymbol(O) mcolor(black) msize(tiny) xtitle(" ") ytitle("Birth Rate") xline(756, lc(grey%40) lp(shortdash)) yline(0, lc(grey) lp(solid)) xla(684(6)765, format(%tm) angle(45)) legend(off) title("Bachelor's Degree")

graph save event_birthrate_bach_month_nonseasonal, replace
graph export event_birthrate_bach_month_nonseasonal.svg, replace as(svg)

**Birth Rate - Graduate Degree
use full_data_monthly.dta, clear
xtset statefips monthyear
qui sdid birthrate_Grad_d statefips monthyear product_year if excluded == 0, vce(noinference) covariates(unemp_rate share_black share_white share_asian share_hispanic formula_shortage) graph
matrix lambda = e(lambda)[1..72,1]
matrix yco = e(series)[1..72,2]
matrix ytr = e(series)[1..72,3]
matrix aux = lambda'*(ytr-yco)
scalar meanpre_o = aux[1,1]

matrix difference = e(difference)[1..84,1..2]
svmat difference
ren (difference1 difference2) (time d)
replace d = d - meanpre_o

local b = 1
local B = 500
while `b' <= `B'{
	preserve
	bsample, cluster(statefips) idcluster(c2)
	qui count if product_year == 0
	local r1 = r(N)
	qui count if product_year != 0
	local r2 = r(N)
	if (`r1'!=0 & `r2' !=0){
		qui sdid birthrate_Grad_d c2 monthyear product_year if excluded == 0, vce(noinference) covariates(unemp_rate share_black share_white share_asian share_hispanic formula_shortage) graph
		matrix lambda_b = e(lambda)[1..72,1]
		matrix yco_b = e(series)[1..72,2]
		matrix ytr_b = e(series)[1..72,3]
		matrix aux_b = lambda_b'*(ytr_b - yco_b)
		matrix meanpre_b = J(84, 1, aux_b[1,1])
		
		matrix d`b' = e(difference)[1..84,2] - meanpre_b
		local ++b	
	}
	restore
}

keep time d
keep if time !=.

local b = 1
local B = 500

forval b=1/`B' {
	svmat d`b'
}

egen rsd = rowsd(d11 - d5001)
gen LCI = d + invnormal(0.025)*rsd
gen UCI = d + invnormal(0.975)*rsd

tw rarea UCI LCI time, lwidth(none) fcolor(purple%50) fintensity(inten40) || connected d time, color(purple) m(d) msymbol(O) mcolor(black) msize(tiny) xtitle(" ") ytitle("Birth Rate") xline(756, lc(grey%40) lp(shortdash)) yline(0, lc(grey) lp(solid)) xla(684(6)765, format(%tm) angle(45)) legend(off) title("Graduate Degree")

graph save event_birthrate_grad_month_nonseasonal, replace
graph export event_birthrate_grad_month_nonseasonal.svg, replace as(svg)

*Combine education birth rate event studies
graph combine event_birthrate_lessHS_month_nonseasonal.gph event_birthrate_HS_month_nonseasonal.gph event_birthrate_somecollege_month_nonseasonal.gph event_birthrate_bach_month_nonseasonal.gph event_birthrate_grad_month_nonseasonal.gph, rows(2) xsize(8) ysize(4) ycommon
graph save event_birthrate_educ_month_nonseasonal, replace
graph export event_birthrate_educ_month_nonseasonal.svg, replace as(svg)
graph export event_birthrate_educ_month_nonseasonal.png, replace as(png)


***Figure A3: SDID Event Studies for WIC Participation (logged) by Segments
**Pregnant Women
use full_data_monthly.dta, clear
xtset statefips monthyear
qui sdid ln_preg_d statefips monthyear product_year if excluded == 0, vce(noinference) covariates(unemp_rate share_black share_white share_asian share_hispanic formula_shortage) graph
matrix lambda = e(lambda)[1..72,1]
matrix yco = e(series)[1..72,2]
matrix ytr = e(series)[1..72,3]
matrix aux = lambda'*(ytr-yco)
scalar meanpre_o = aux[1,1]

matrix difference = e(difference)[1..84,1..2]
svmat difference
ren (difference1 difference2) (time d)
replace d = d - meanpre_o

local b = 1
local B = 500
while `b' <= `B'{
	preserve
	bsample, cluster(statefips) idcluster(c2)
	qui count if product_year == 0
	local r1 = r(N)
	qui count if product_year != 0
	local r2 = r(N)
	if (`r1'!=0 & `r2' !=0){
		qui sdid ln_preg_d c2 monthyear product_year if excluded == 0, vce(noinference) covariates(unemp_rate share_black share_white share_asian share_hispanic formula_shortage) graph
		matrix lambda_b = e(lambda)[1..72,1]
		matrix yco_b = e(series)[1..72,2]
		matrix ytr_b = e(series)[1..72,3]
		matrix aux_b = lambda_b'*(ytr_b - yco_b)
		matrix meanpre_b = J(84, 1, aux_b[1,1])
		
		matrix d`b' = e(difference)[1..84,2] - meanpre_b
		local ++b	
	}
	restore
}

keep time d
keep if time !=.

local b = 1
local B = 500

forval b=1/`B' {
	svmat d`b'
}

egen rsd = rowsd(d11 - d5001)
gen LCI = d + invnormal(0.025)*rsd
gen UCI = d + invnormal(0.975)*rsd

tw rarea UCI LCI time, lwidth(none) fcolor(purple%50) fintensity(inten40) || connected d time, color(purple) m(d) msymbol(O) mcolor(black) msize(tiny) xtitle(" ") ytitle("Pariticpation (logged)") xline(756, lc(grey%40) lp(shortdash)) yline(0, lc(grey) lp(solid)) xla(684(6)765, format(%tm) angle(45)) legend(off) title("Pregnant Women")

graph save event_preg_WICln_month_nonseasonal, replace

**Breastfeeding Women 
use full_data_monthly.dta, clear
xtset statefips monthyear
qui sdid ln_breast_d statefips monthyear product_year if excluded == 0, vce(noinference) covariates(unemp_rate share_black share_white share_asian share_hispanic formula_shortage) graph
matrix lambda = e(lambda)[1..72,1]
matrix yco = e(series)[1..72,2]
matrix ytr = e(series)[1..72,3]
matrix aux = lambda'*(ytr-yco)
scalar meanpre_o = aux[1,1]

matrix difference = e(difference)[1..84,1..2]
svmat difference
ren (difference1 difference2) (time d)
replace d = d - meanpre_o

local b = 1
local B = 500
while `b' <= `B'{
	preserve
	bsample, cluster(statefips) idcluster(c2)
	qui count if product_year == 0
	local r1 = r(N)
	qui count if product_year != 0
	local r2 = r(N)
	if (`r1'!=0 & `r2' !=0){
		qui sdid ln_breast_d c2 monthyear product_year if excluded == 0, vce(noinference) covariates(unemp_rate share_black share_white share_asian share_hispanic formula_shortage) graph
		matrix lambda_b = e(lambda)[1..72,1]
		matrix yco_b = e(series)[1..72,2]
		matrix ytr_b = e(series)[1..72,3]
		matrix aux_b = lambda_b'*(ytr_b - yco_b)
		matrix meanpre_b = J(84, 1, aux_b[1,1])
		
		matrix d`b' = e(difference)[1..84,2] - meanpre_b
		local ++b	
	}
	restore
}

keep time d
keep if time !=.

local b = 1
local B = 500

forval b=1/`B' {
	svmat d`b'
}

egen rsd = rowsd(d11 - d5001)
gen LCI = d + invnormal(0.025)*rsd
gen UCI = d + invnormal(0.975)*rsd

tw rarea UCI LCI time, lwidth(none) fcolor(purple%50) fintensity(inten40) || connected d time, color(purple) m(d) msymbol(O) mcolor(black) msize(tiny) xtitle(" ") ytitle("Pariticpation (logged)") xline(756, lc(grey%40) lp(shortdash)) yline(0, lc(grey) lp(solid)) xla(684(6)765, format(%tm) angle(45)) legend(off) title("Breast Feeding Women")

graph save event_breast_WICln_month_nonseasonal, replace

**Postpartum Women 
use full_data_monthly.dta, clear
xtset statefips monthyear
qui sdid ln_post_d statefips monthyear product_year if excluded == 0, vce(noinference) covariates(unemp_rate share_black share_white share_asian share_hispanic formula_shortage) graph
matrix lambda = e(lambda)[1..72,1]
matrix yco = e(series)[1..72,2]
matrix ytr = e(series)[1..72,3]
matrix aux = lambda'*(ytr-yco)
scalar meanpre_o = aux[1,1]

matrix difference = e(difference)[1..84,1..2]
svmat difference
ren (difference1 difference2) (time d)
replace d = d - meanpre_o

local b = 1
local B = 500
while `b' <= `B'{
	preserve
	bsample, cluster(statefips) idcluster(c2)
	qui count if product_year == 0
	local r1 = r(N)
	qui count if product_year != 0
	local r2 = r(N)
	if (`r1'!=0 & `r2' !=0){
		qui sdid ln_post_d c2 monthyear product_year if excluded == 0, vce(noinference) covariates(unemp_rate share_black share_white share_asian share_hispanic formula_shortage) graph
		matrix lambda_b = e(lambda)[1..72,1]
		matrix yco_b = e(series)[1..72,2]
		matrix ytr_b = e(series)[1..72,3]
		matrix aux_b = lambda_b'*(ytr_b - yco_b)
		matrix meanpre_b = J(84, 1, aux_b[1,1])
		
		matrix d`b' = e(difference)[1..84,2] - meanpre_b
		local ++b	
	}
	restore
}

keep time d
keep if time !=.

local b = 1
local B = 500

forval b=1/`B' {
	svmat d`b'
}

egen rsd = rowsd(d11 - d5001)
gen LCI = d + invnormal(0.025)*rsd
gen UCI = d + invnormal(0.975)*rsd

tw rarea UCI LCI time, lwidth(none) fcolor(purple%50) fintensity(inten40) || connected d time, color(purple) m(d) msymbol(O) msize(tiny) mcolor(black) xtitle(" ") ytitle("Pariticpation (logged)") xline(756, lc(grey%40) lp(shortdash)) yline(0, lc(grey) lp(solid)) xla(684(6)765, format(%tm) angle(45)) legend(off) title("Postpartum Women")

graph save event_post_WICln_month_nonseasonal, replace

*Combine graphs
graph combine event_preg_WICln_month_nonseasonal.gph event_post_WICln_month_nonseasonal.gph event_breast_WICln_month_nonseasonal.gph, rows(1) xsize(9) ysize(3) ycommon
graph save event_WICln_womencombo_month_nonseasonal.gph, replace
graph export event_WICln_womencombo_month_nonseasonal.svg, replace as(svg)
graph export event_WICln_womencombo_month_nonseasonal.png, replace as(png)


**Partially Breastfed Infants
use full_data_monthly.dta, clear
xtset statefips monthyear
qui sdid ln_infantpb_d statefips monthyear product_year if excluded == 0, vce(noinference) covariates(unemp_rate share_black share_white share_asian share_hispanic formula_shortage) graph
matrix lambda = e(lambda)[1..72,1]
matrix yco = e(series)[1..72,2]
matrix ytr = e(series)[1..72,3]
matrix aux = lambda'*(ytr-yco)
scalar meanpre_o = aux[1,1]

matrix difference = e(difference)[1..84,1..2]
svmat difference
ren (difference1 difference2) (time d)
replace d = d - meanpre_o

local b = 1
local B = 500
while `b' <= `B'{
	preserve
	bsample, cluster(statefips) idcluster(c2)
	qui count if product_year == 0
	local r1 = r(N)
	qui count if product_year != 0
	local r2 = r(N)
	if (`r1'!=0 & `r2' !=0){
		qui sdid ln_infantpb_d c2 monthyear product_year if excluded == 0, vce(noinference) covariates(unemp_rate share_black share_white share_asian share_hispanic formula_shortage) graph
		matrix lambda_b = e(lambda)[1..72,1]
		matrix yco_b = e(series)[1..72,2]
		matrix ytr_b = e(series)[1..72,3]
		matrix aux_b = lambda_b'*(ytr_b - yco_b)
		matrix meanpre_b = J(84, 1, aux_b[1,1])
		
		matrix d`b' = e(difference)[1..84,2] - meanpre_b
		local ++b	
	}
	restore
}

keep time d
keep if time !=.

local b = 1
local B = 500

forval b=1/`B' {
	svmat d`b'
}

egen rsd = rowsd(d11 - d5001)
gen LCI = d + invnormal(0.025)*rsd
gen UCI = d + invnormal(0.975)*rsd

tw rarea UCI LCI time, lwidth(none) fcolor(purple%50) fintensity(inten40) || connected d time, color(purple) m(d) msymbol(O) mcolor(black) msize(tiny) xtitle(" ") ytitle("Pariticpation (logged)") xline(756, lc(grey%40) lp(shortdash)) yline(0, lc(grey) lp(solid)) xla(684(6)765, format(%tm) angle(45)) legend(off) title("Partially Breastfed Infants")

graph save event_infantpb_WICln_month_nonseasonal, replace

**Fully Breastfed Infants
use full_data_monthly.dta, clear
xtset statefips monthyear
qui sdid ln_infantfb_d statefips monthyear product_year if excluded == 0, vce(noinference) covariates(unemp_rate share_black share_white share_asian share_hispanic formula_shortage) graph
matrix lambda = e(lambda)[1..72,1]
matrix yco = e(series)[1..72,2]
matrix ytr = e(series)[1..72,3]
matrix aux = lambda'*(ytr-yco)
scalar meanpre_o = aux[1,1]

matrix difference = e(difference)[1..84,1..2]
svmat difference
ren (difference1 difference2) (time d)
replace d = d - meanpre_o

local b = 1
local B = 500
while `b' <= `B'{
	preserve
	bsample, cluster(statefips) idcluster(c2)
	qui count if product_year == 0
	local r1 = r(N)
	qui count if product_year != 0
	local r2 = r(N)
	if (`r1'!=0 & `r2' !=0){
		qui sdid ln_infantfb_d c2 monthyear product_year if excluded == 0, vce(noinference) covariates(unemp_rate share_black share_white share_asian share_hispanic formula_shortage) graph
		matrix lambda_b = e(lambda)[1..72,1]
		matrix yco_b = e(series)[1..72,2]
		matrix ytr_b = e(series)[1..72,3]
		matrix aux_b = lambda_b'*(ytr_b - yco_b)
		matrix meanpre_b = J(84, 1, aux_b[1,1])
		
		matrix d`b' = e(difference)[1..84,2] - meanpre_b
		local ++b	
	}
	restore
}

keep time d
keep if time !=.

local b = 1
local B = 500

forval b=1/`B' {
	svmat d`b'
}

egen rsd = rowsd(d11 - d5001)
gen LCI = d + invnormal(0.025)*rsd
gen UCI = d + invnormal(0.975)*rsd

tw rarea UCI LCI time, lwidth(none) fcolor(purple%50) fintensity(inten40) || connected d time, color(purple) m(d) msymbol(O) mcolor(black) msize(tiny) xtitle(" ") ytitle("Pariticpation (logged)") xline(756, lc(grey%40) lp(shortdash)) yline(0, lc(grey) lp(solid)) xla(684(6)765, format(%tm) angle(45)) legend(off) title("Fully Breastfed Infants")

graph save event_infantfb_WICln_month_nonseasonal, replace

**Fully Formula Fed Infants
xtset statefips monthyear
qui sdid ln_infantf_d statefips monthyear product_year if excluded == 0, vce(noinference) covariates(unemp_rate share_black share_white share_asian share_hispanic formula_shortage) graph
matrix lambda = e(lambda)[1..72,1]
matrix yco = e(series)[1..72,2]
matrix ytr = e(series)[1..72,3]
matrix aux = lambda'*(ytr-yco)
scalar meanpre_o = aux[1,1]

matrix difference = e(difference)[1..84,1..2]
svmat difference
ren (difference1 difference2) (time d)
replace d = d - meanpre_o

local b = 1
local B = 500
while `b' <= `B'{
	preserve
	bsample, cluster(statefips) idcluster(c2)
	qui count if product_year == 0
	local r1 = r(N)
	qui count if product_year != 0
	local r2 = r(N)
	if (`r1'!=0 & `r2' !=0){
		qui sdid ln_infantf_d c2 monthyear product_year if excluded == 0, vce(noinference) covariates(unemp_rate share_black share_white share_asian share_hispanic formula_shortage) graph
		matrix lambda_b = e(lambda)[1..72,1]
		matrix yco_b = e(series)[1..72,2]
		matrix ytr_b = e(series)[1..72,3]
		matrix aux_b = lambda_b'*(ytr_b - yco_b)
		matrix meanpre_b = J(84, 1, aux_b[1,1])
		
		matrix d`b' = e(difference)[1..84,2] - meanpre_b
		local ++b	
	}
	restore
}

keep time d
keep if time !=.

local b = 1
local B = 500

forval b=1/`B' {
	svmat d`b'
}

egen rsd = rowsd(d11 - d5001)
gen LCI = d + invnormal(0.025)*rsd
gen UCI = d + invnormal(0.975)*rsd

tw rarea UCI LCI time, lwidth(none) fcolor(purple%50) fintensity(inten40) || connected d time, color(purple) m(d) msymbol(O) mcolor(black) msize(tiny) xtitle(" ") ytitle("Pariticpation (logged)") xline(756, lc(grey%40) lp(shortdash)) yline(0, lc(grey) lp(solid)) xla(684(6)765, format(%tm) angle(45)) legend(off) title("Fully Formula Fed Infants")

graph save event_infantf_WICln_month_nonseasonal, replace

*Combine graphs into one figure
graph combine event_infantpb_WICln_month_nonseasonal.gph event_infantfb_WICln_month_nonseasonal.gph event_infantf_WICln_month_nonseasonal.gph, rows(1) xsize(9) ysize(3) ycommon
graph save event_WICln_infantcombo_month_nonseasonal, replace 
graph export event_WICln_infantcombo_month_nonseasonal.svg, replace as(svg)
graph export event_WICln_infantcombo_month_nonseasonal.png, replace as(png)