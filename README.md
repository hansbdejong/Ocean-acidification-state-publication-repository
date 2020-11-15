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

We calculate Omega_Ar and Dissolved Inorganic Carbon (DIC) for underway samples with CO2SYS for MATLAB (Lewis and
Wallace, 1998; van Heuven et al., 2011 - https://cdiac.ess-dive.lbl.gov/ftp/co2sys/CO2SYS_calc_MATLAB_v1.1/) with TA, pCO2,
SST, and salinity as input variables. This script also crosschecks the accuracy of our Omega_Ar estimates using pH. 

## Ross Sea and Southern Ocean calculations

### 
