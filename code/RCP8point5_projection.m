% Calculates future Omega for the Ross Sea based on RCP 8.5 projections
% and an equilibrium and disequilibrium scenario

cd('C:\')

RCP=xlsread('RCP8.5_projected_pCO2.xlsx')

% pCO2 equilibrium - increase pCO2 by the same amount as the projected 
% increase in atmospheric CO2

% pCO2 disequilibrium (McNeil et al., 2009)- disequilibrium due to sea ice
% Increase pCO2 by only 35% of the increase in projected atmospheric CO2.

pCO2_diseq=RCP(:,3)
pCO2_eq=RCP(:,4)


% uses the lowest measured Omega Aragonite (from Nov 2006) to project when
% the Ross Sea may become corrosive to aragonite

%TA = 2328, Sal = 34.33, SST = -1.87, phosphate = 2.1, silicate = 79)
output_diseq = CO2SYS(2328,pCO2_diseq,1,4,34.33,-1.87,-1.87,0,0,79,2.1,1,4,1);
output_eq = CO2SYS(2328,pCO2_eq,1,4,34.33,-1.87,-1.87,0,0,79,2.1,1,4,1);

Ca_eq = output_eq(:,30)
Ca_diseq = output_diseq(:,30)
Ar_eq = output_eq(:,31)
Ar_diseq = output_diseq(:,31)

final = horzcat(Ca_eq, Ca_diseq, Ar_eq, Ar_diseq);
filename = 'RCP8.5_output.xlsx'
xlswrite(filename,final)

