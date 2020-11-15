%{
    
pCO2 is measured every 3 minutes. In order to link a pCO2 measurement
with TA measurement (measured every 24 minutes), we interpolate the pCO2
measurements into minute bins.

xkept is the minute since the beginning of the cruise
ykept is the pCO2 value at that minute

e.g. 
1	255.09
4	254.99
6	255

number is the total number of minutes between the first and last pCO2
measurement (44204 minutes)
    
%}

cd('C:\')
A = xlsread('interpolate');
xkept = A(1:length(A),1);
ykept = A(1:length(A),2);
number = (1:44204);

%This function does the linear interpolation
C = interp1(xkept,ykept,number)
D = C';

filename = 'interpolate_pCO2.xlsx'
xlswrite(filename,D)
