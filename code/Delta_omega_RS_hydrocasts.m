% Calculates Omega_Ar from surface hydrocasts and those hydrocasts
% between 200 - 400 m (representing winter water). This difference
% represents the change in Omega_Ar between the winter and each station
% arrival time

A = xlsread('Controls_Omega_HC_Ross_Sea');

%surface measurements
DIC = A(:,4);
temp = A(:,10);
sal = A(:,9);
TA = A(:,6);

%winter measurements approximated by the mean water column values between
%200 - 400 m
DIC_200_400 = A(:,17);
TA_200_400 = A(:,18);
sal_200_400 = A(:,16);

output = CO2SYS(TA,DIC,1,2,sal,temp,temp,0,0,0,0,1,4,1);
Omega_surface = output(:,31);

%set temp to -1.89 C
output_winter = CO2SYS(TA_200_400,DIC_200_400,1,2,sal_200_400,-1.89,-1.89,0,0,0,0,1,4,1);
Omega_winter = output_winter(:,31);

final = horzcat(Omega_surface, Omega_winter);
filename = 'Omega_hydrocasts.xlsx'
xlswrite(filename,final)

