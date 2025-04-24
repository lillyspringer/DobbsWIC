
***Figure 1 - States' Abortion Status Map
ssc install geo2xy
net get geo2xy

use geo2xy_us_coor.dta, clear

// flip longitudes to reconnect Hawaii and Alaska
replace _X = cond(_X > 0, _X - 180, _X + 180) if inlist(_ID, 14, 42)

// Alaska - USGS recommends standard parallels of 55 and 65 north
sum _X if _ID == 14
local midlon = (r(min) + r(max)) / 2
geo2xy _Y _X if _ID == 14, replace ///
        proj(albers, 6378137 298.257223563 55 65 0 `midlon')
replace _Y = _Y / 3 + 800000 if _ID == 14
replace _X = _X / 3 - 1700000 if _ID == 14

// Hawaii - USGS recommends standard parallels of 8 and 18 north
sum _X if _ID == 42
local midlon = (r(min) + r(max)) / 2
geo2xy _Y _X if _ID == 42, replace ///
        proj(albers, 6378137 298.257223563 8 18 0 `midlon')
replace _Y = _Y / 1.2 + 850000 if _ID == 42
replace _X = _X / 1.2 - 800000 if _ID == 42

// Puerto Rico
geo2xy _Y _X if _ID == 39, replace proj(albers)
replace _Y = _Y + 500000 if _ID == 39
replace _X = _X + 2000000 if _ID == 39

// 48 states - USGS recommends standard parallels of 29.5 and 45.5 north
sum _X if !inlist(_ID, 14, 42, 39)
local midlon = (r(min) + r(max)) / 2
geo2xy _Y _X if !inlist(_ID, 14, 42, 39), replace ///
        proj(albers, 6378137 298.257223563 29.5 45.5 0 `midlon')
		
save xy_coor.dta, replace

use geo2xy_us_data.dta, clear
rename STATEFP statefip
save geo2xy_us_data.dta, replace

use abortion_policies.dta, clear
gen abortionpolicy = .
replace abortionpolicy = 2 if fullban == 1
replace abortionpolicy = 1 if protected == 1
replace abortionpolicy = . if excluded == 1
label define lab1 0 "Total Ban" 1 "Protected Access" . "Excluded"
label values abortionpolicy lab1
tostring statefip, replace

save abortion_policies.dta, replace

merge 1:1 statefip using geo2xy_us_data
drop if _merge==2

spmap abortionpolicy using xy_coor.dta, id(_ID) fcolor(erose*.5 purple*.5) mfcolor(white) legend(position(6) ring(1) region(style(background)) row(1)  label(1 "Excluded (13)") size(small)) legcount legstyle(3) clmethod(unique) 

graph export abortionstate_map.png, replace as(png)
graph export abortionstate_map.svg, replace as(svg)
save state_abortion_map.dta, replace
