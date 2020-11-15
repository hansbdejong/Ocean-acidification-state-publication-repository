# Ocean-acidification-state-publication-repository
Code from the publication: DeJong, H. B., et al. "Carbonate saturation state of surface waters in the Ross Sea and Southern Ocean: controls and implications for the onset of aragonite undersaturation." Biogeosciences 12.23 (2015): 6881. (https://bg.copernicus.org/articles/12/6881/2015/)

## Figures
All of the figures were made using MATLAB. Many of the figures contain maps. We used the m-map MATLAB package (https://www.eoas.ubc.ca/~rich/map.html)

## Data Wrangling and carbon system calculations and crosschecks
This publication focuses on ocean acidification state measurements conducted on surface waters in the Ross Sea (Antarctica) and Southern Ocean. Temperature (T) and salinity (S) were measured continuously through sensors and were binned into 1 minute intervals. pCO2 was measured around every 3 minutes and total alkalinity (TA) was measured around every 24 minutes. We use these measurements to calculate other parameters, most notably the saturation state of aragonite (Omega_Ar).

We produce a tidy dataset with all variables (T, S, TA, and pCO2). We use a timestamp (yyyyMMddHHmm) to merge these datasets with TA (measured the least frequently). 

### pCO2_interpolate.m
Interpolates the pCO2 data (collected every 3 minutes) into minute bins using linear interpolation. We use VLOOKUP in Excel to merge T, S, and pCO2 with TA.

### pH_extraction.m
As a means of internal quality control, we use the initial pH reading from the TA titration as a third carbon system parameter to crosscheck the accuracy of our Omega_Ar estimates. The script pH_extraction outputs the initial pH reading from each individual raw TA titration file for the crosscheck calculations.

### Omega_calculator.m
We calculate Omega_Ar and Dissolved Inorganic Carbon (DIC) for underway samples with CO2SYS for MATLAB (Lewis and Wallace, 1998; van Heuven et al., 2011 - https://cdiac.ess-dive.lbl.gov/ftp/co2sys/CO2SYS_calc_MATLAB_v1.1/) with TA, pCO2, SST, and salinity as input variables. This script also crosschecks the accuracy of our Omega_Ar estimates using pH. 

## Ross Sea and Southern Ocean calculations

### Delta_omega_ross_sea_hydrocasts.m
We use DIC, TA, T, and salinity to determine the controls on the seasonal cycle of surface water Omega_Ar. Due to the deep convective mixing during the winter, we use the average salinity normalized DIC and TA concentrations of hydrocast samples collected from 200 to 400m to determine winter water values. This script calculates the difference in Omega_Ar between the winter (water samples between 200 and 400m) and the late summer (surface water samples).

### Partial_derivatives_ross_sea.m 
The change in Omega_Ar of surface hydrocast samples (upper 10 m) from winter conditions can be expressed as the changes in DIC, TA, T, and S. The partial derivatives quantify the change in Omega_Ar per unit change in DIC, TA, temperature, and salinity. To determine the partial derivatives, we calculate Omega_Ar for all hydrocast samples within the upper 10m using DIC, TA, temperature, and salinity as input parameters. We recalculate Omega_Ar after independently increasing DIC, TA, temperature, and salinity by one unit. The partial derivatives are the average difference between the initial Omega_Ar and the recalculated Omega_Ar. We use these partial derivatives to evaluate the relative importance of DIC, TA, temperature, and salinity on the seasonal variability of surface water Omega_Ar. 

### Partial_derivatives_southern_ocean.m
We use the same approach to evaluate the relative importance of DIC, TA, temperature, and salinity on the variability of Omega_Ar in the Southern Ocean from 75 to 55 degrees S. We calculate the partial derivatives using DIC (calculated), TA, temperature, and salinity from surface water samples between 75 and 55 degrees S. 

## Estimate of wintertime surface Omega_Ar values in the Ross Sea

### Nov_omega_calculator.m
To calculate Omega_Ar from early spring surface waters, we use the LDEO pCO2 measurements from November 1994, 1997, 2005, and 2006 that are from the
Ross Shelf (defined by the 1000m isopleth) and are south of 74 degrees S. We calculate wintertime TA in the Ross Sea by establishing
a salinity–TA relationship using data from Bates et al. (1998), Sweeney et al. (2000b), and our own hydrocast TA measurements from the upper 10m. We calculate historical Omega_Ar using historical pCO2 measurements, salinity-derived TA, SST, and salinity. Phosphate and silicate are set to the winter values of 2.1 and 79 μmol kg􀀀1, respectively.

### Error_analysis_omega_from_salinity.m
The TSG salinity data from the historical pCO2 measurements appear reasonable and are uncalibrated. While the largest offset in TSG salinity compared with Autosal measurements is 0.3, such error is not typical. To test the possible impact of a poor salinity calibration, we recalculate Omega_Ar for all pCO2 measurements after increasing salinity by 0.3.

### RCP8point5_projection.m
Following McNeil et al. (2010) and a Representative Concentration Pathway (RCP8.5) scenario (Meinshausen et al., 2011), we use the lowest Omega_Ar values from 2006 (Omega_Ar = 1.20, pCO2 = 428 μatm, TA = 2328 μmol kg-1, salinity = 34.33, SSTD = 1.87 degrees C, phosphate = 2.1 μmol kg-1, silicate = 79 μmol kg-1) to assess when the Ross Sea could become corrosive to aragonite.



