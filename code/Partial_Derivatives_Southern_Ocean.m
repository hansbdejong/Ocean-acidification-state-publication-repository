% This script calculates the partial derivatives that quantify the 
% the change in Omega_Ar per unit change in DIC, TA, temperature, and salinity.

cd('C:\')
A = xlsread('Input_delta_omega');
DIC = A(:,7);
TA = A(:,3);
sal = A(:,2);
temp = A(:,5);

% calculate omega + 1 and - 1 for each variable
DIC_plus = DIC + 1;
TA_plus = TA + 1;
sal_plus = sal + 1;
temp_plus = temp + 1;

DIC_minus = DIC - 1;
TA_minus = TA - 1;
sal_minus = sal - 1;
temp_minus = temp - 1;

% Uses CO2SYS to perform calculations
output_init = CO2SYS(TA,DIC,1,2,sal,temp,temp,0,0,0,0,1,4,1);
output_DIC_plus = CO2SYS(TA,DIC_plus,1,2,sal,temp,temp,0,0,0,0,1,4,1);
output_TA_plus = CO2SYS(TA_1,DIC,plus,2,sal,temp,temp,0,0,0,0,1,4,1);
output_sal_plus = CO2SYS(TA,DIC,1,2,sal_plus,temp,temp,0,0,0,0,1,4,1);
output_temp_plus = CO2SYS(TA,DIC,1,2,sal,temp_plus,temp_plus,0,0,0,0,1,4,1);
%--------------------------------------------------------------------------
output_DIC_minus = CO2SYS(TA,DIC_minus,1,2,sal,temp,temp,0,0,0,0,1,4,1);
output_TA_minus = CO2SYS(TA_minus,DIC,1,2,sal,temp,temp,0,0,0,0,1,4,1);
output_sal_minus = CO2SYS(TA,DIC,1,2,sal_minus,temp,temp,0,0,0,0,1,4,1);
output_temp_minus = CO2SYS(TA,DIC,1,2,sal,temp_minus,temp_minus,0,0,0,0,1,4,1);
%-----------------------------------------------------------------------------

%Omega for input variable + 1
Omega_init = output_init(:,31);
Omega_DIC = output_DIC_plus(:,31);
Omega_TA = output_TA_plus(:,31);
Omega_sal = output_sal_plus(:,31);
Omega_temp = output_temp_plus(:,31);

%--------------------------------------------------------------------------

%Omega for input variable - 1
Omega_DIC_minus = output_DIC_minus(:,31);
Omega_TA_minus = output_TA_minus(:,31);
Omega_sal_minus = output_sal_minus(:,31);
Omega_temp_minus = output_temp_minus(:,31);
%--------------------------------------------------------------------------

%Write files
final=horzcat(Omega_init, Omega_DIC, Omega_TA, Omega_sal, Omega_temp);
filename = 'Delta_Omega_plus.xlsx';
xlswrite(filename,final)

final_minus = horzcat(Omega_init, Omega_DIC_minus, Omega_TA_minus,...
    Omega_sal_minus, Omega_temp_minus);
filename = 'Delta_Omega_minus.xlsx';
xlswrite(filename, final_minus)


