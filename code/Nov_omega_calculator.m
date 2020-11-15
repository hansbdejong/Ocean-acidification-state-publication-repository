% Here we calculate surface Omega using historical pCO2 data from November

% data input
A = xlsread('97-8');
% Repeat with the other years below
%04-8, 05-8, 06-8, 94-6, 96-5, 97-3, 97-8

pCO2 = A(:,14);
temp = A(:,8);
sal = A(:,9);
% Total Alkalinity is calculated from salinity
% TA = 68.9 * S - 37.8 
TA = A(:,15); 

%phosphate = 2.1, % silicate = 79, Mehrbach constants 
%calculate using CO2SYS
output = CO2SYS(TA,pCO2,1,4,sal,temp,temp,0,0,79,2.1,1,4,1);

% Resulting Aragonite Omega
Omega = output(:,31);
final = horzcat(TA,pCO2,Omega);
filename = 'output_97_8.xlsx'
xlswrite(filename,final)

