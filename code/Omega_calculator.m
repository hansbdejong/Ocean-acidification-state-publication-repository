% This function uses calculates unknown carbon system parameters using the 
% tidy dataset (time aligned underway measurements: pCO2, temp, sal, TA, pH,and
% pHtemp)

cd('C:\')


% load the aligned underway data
A=xlsread('MASTER_UW_Omega');

pCO2=A(:,6);
temp=A(:,9);
sal=A(:,4);
TA=A(:,5);
pH=A(:,13);
pHtemp=A(:,14);

% calculates pCO2, DIC, and Omega_aragonite using TA and pCO2 and TA and pH
% This acts as a crosscheck to ensure high quality measurements. 

% TA-pCO2 calculations 
output=CO2SYS(TA,pCO2,1,4,sal,temp,temp,0,0,0,0,1,4,1);
Omega_Ar=output(:,31);
Omega_Ca=output(:,30);
DIC=output(:,2);

final=horzcat(TA,pCO2,Omega_Ar, Omega_Ca,DIC);
filename='Omega_output.xlsx'
xlswrite(filename,final)

%TA-pH calculations 
output2=CO2SYS(TA,pH,1,3,sal,pHtemp,temp,0,0,0,0,4,4,1);
Omega_2=output2(:,31);
DIC_2=output2(:,2);
pCO2_2=output2(:,19);
final_2=horzcat(TA,pCO2_2,Omega_2,DIC_2);
filename ='Omega_output2.xlsx'
xlswrite(filename, final_2)


