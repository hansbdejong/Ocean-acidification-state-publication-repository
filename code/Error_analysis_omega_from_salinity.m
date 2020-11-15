% Here we assess how much our Omega calculations would change
% if the salinity measurement were not that accurate (plus-minus 0.3)

% contains all the pCO2 data from all years (November)
A = xlsread('Combined04_05_06_94_96_97');

pCO2 = A(:,14);
temp = A(:,8);
sal = A(:,9);
sal_plus = sal + 0.3;
sal_minus = sal - 0.3;

% calculated TA from salinity, including plus-minus salinity of 0.3
TA = 68.912 * sal - 37.809;
TA_plus = 68.912 * sal_plus - 37.809;
TA_minus = 68.912 * sal_minus - 37.809;

% phosphorus = 2.1, silicate = 79 umol kg-1 
outputTA = CO2SYS(TA,pCO2,1,4,sal,temp,temp,0,0,79,2.1,1,4,1);
outputTA_plus = CO2SYS(TA_plus,pCO2,1,4,sal,temp,temp,0,0,79,2.1,1,4,1);
outputTA_minus = CO2SYS(TA_minus,pCO2,1,4,sal,temp,temp,0,0,79,2.1,1,4,1);

% Calculated Omegas
Omega = outputTA(:,31);
Omega_plus = outputTA_plus(:,31);
Omega_minus = outputTA_minus(:,31);

% Calculating errors
diff_plus = Omega_plus - Omega;
diff_minus = Omega - Omega_minus;

mean(diff_plus)
std(diff_plus)
mean(diff_minus)
std(diff_minus)

